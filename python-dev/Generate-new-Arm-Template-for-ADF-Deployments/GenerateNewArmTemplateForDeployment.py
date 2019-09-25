import json
import time

'''
All Functions
'''

def replacer(text, replacement_list, replacement_dict):
    for item in replacement_list:
        text = text.replace(item, replacement_dict[item])
    return text


def cleanstring(unclean_string):
    # dependency comes as a string which is essentially a Data Factory concat function which uses a ',' as  a separator
    split_unclean_string = unclean_string.split(',')
    # find last index of character '/' and "'" (single quote) and keep what is between
    index_last_backslash = split_unclean_string[1].rfind('/')
    index_last_quote = split_unclean_string[1].rfind("'")
    clean_string = split_unclean_string[1][index_last_backslash +
                                           1:index_last_quote]
    return clean_string


def findalldependencies(json_block, pipeline_name):

    pipeline_dependencies_list = [pipeline_name]
    pipeline_dependencies_list_unique = []

    for item in json_block:
        if item["name"].find(pipeline_name) > 0:
            for dependency in item["dependsOn"]:
                pipeline_dependencies_list.append(cleanstring(dependency))

    # SV debug 20190925 - added controller variable to kill infinite loops
    controller = 100
    for name in pipeline_dependencies_list:
        if controller > 0:
            for resource in json_block:
                if resource["name"].find(name) > 0:
                    for dependency in resource["dependsOn"]:
                        pipeline_dependencies_list.append(cleanstring(dependency))
            controller -= 1
        else:
            break

    # Uniquify the above list
    for item in pipeline_dependencies_list:
        if item not in pipeline_dependencies_list_unique:
            pipeline_dependencies_list_unique.append(item)

    return pipeline_dependencies_list_unique


'''
Open all JSON files
'''

with open("config.json", "r") as m:
    newmapping = json.load(m)

with open("arm_template.json", "r") as f:
    datafactory = json.load(f)

with open("arm_template_parameters.json", "r") as p:
    datafactory_parms = json.load(p)

datafactory_resources = datafactory["resources"]

IN_pipeline_name = input(
    'Give the precise name of ADF Pipeline you want to deploy: ')

while True:
    IN_datafactory_flag = input(
        'For deployment to ADF Dev insert "dev", to ADF Live type in "live", to ADF Live-Replica type in "replica" : ')
    if IN_datafactory_flag.lower() not in ['dev', 'live', 'replica']:
        print('Not an accepted value - Please re-enter')
        continue
    elif IN_datafactory_flag.lower() == 'dev':
        data_factory_name = 'BIDataFactoryDev'
        break
    elif IN_datafactory_flag.lower() == 'live':
        data_factory_name = 'BIDataFactoryLive'
        break
    else:
        data_factory_name = 'BIDataFactoryLive-REPLICA'
        break

# Create the JSON block code for the resources you need deployed to the new DF environment
all_resources_list = findalldependencies(
    datafactory_resources, IN_pipeline_name)

clean_resources_list = []
for resource in all_resources_list:
    for item in datafactory_resources:
        if item["name"].find(resource) > 0:
            clean_resources_list.append(item)

'''
Start of Enrichment Block
'''

# Replace the resources with the ones you need
datafactory["resources"] = clean_resources_list
# Change to Data Factory name you are deploying to
datafactory["parameters"]["factoryName"]["defaultValue"] = data_factory_name
datafactory_parms["parameters"]["factoryName"]["value"] = data_factory_name
# Enrich Connection Strings
datafactory_parms["parameters"]["AzureDB_connectionString"]["value"] = newmapping["AzureDB"]["typeProperties"]["connectionString"]
datafactory_parms["parameters"]["AzureBlob_connectionString"]["value"] = newmapping["AzureBlob"]["typeProperties"]["connectionString"]

if data_factory_name == 'BIDataFactoryLive-REPLICA':
    # Add/Enrich new key-value pairs for Production Linked Services
    datafactory["parameters"]["LD9BA1-IR_properties_typeProperties_linkedInfo_resourceId"] = newmapping["LD9BA1-IR_properties_typeProperties_linkedInfo_resourceId"]
    datafactory_parms["parameters"]["LD9BA1-IR_properties_typeProperties_linkedInfo_resourceId"] = {
        "value": newmapping["LD9BA1-IR_properties_typeProperties_linkedInfo_resourceId"]["defaultValue"]}
    for item in datafactory_resources:
        if item["name"] == "[concat(parameters('factoryName'), '/IR-ColartSQL04')]":
            item["properties"]["typeProperties"] = newmapping["LD9BA1-IR_typeProperties"]

# Turn the dict into string type, in order to save to a new file
datafactory_string = json.dumps(datafactory, indent=2)
datafactory_parms_string = json.dumps(datafactory_parms, indent=2)
# Replace all instances of the DEV values with appropriate PROD ones
values_to_replace_list = newmapping["dev_values_to_replace"].split(',')
prod_datafactory_string = replacer(
    datafactory_string, values_to_replace_list, newmapping)
prod_datafactory_parms_string = replacer(
    datafactory_parms_string, values_to_replace_list, newmapping)

'''
End of Enrichment Block
'''

'''
Write to file
'''

date_int = time.strftime('%Y%m%d')

NewDataFactoryDeploymentFile = open(
    f"adfDevOps.{data_factory_name}_{IN_pipeline_name}__{date_int}.json", "w")
NewDataFactoryDeploymentFile_parms = open(
    f"adfDevOps.{data_factory_name}_{IN_pipeline_name}_parms__{date_int}.json", "w")
NewDataFactoryDeploymentFile.write(prod_datafactory_string)
NewDataFactoryDeploymentFile_parms.write(prod_datafactory_parms_string)
