import os
from os.path import join
import pandas as pd
import json
import csv
import time

'''The following method will create the dictionary with all servers and databases and corresponding max deployment version numbers
'''
def create_max_versions_deployment_dict(filepath):
    max_versions_deployment_dict = {}

    devopslog = pd.read_csv(filepath, usecols = ['server', 'database', 'version'])

    # get the max versions using pandas
    maxversionaggr = {
        'server': 'max',
        'database': 'max',
        'version' : 'max'
        }

    max_deploy_versions_ndarray = devopslog.groupby(['server', 'database']).agg(maxversionaggr).values

    # create list of distinct servers
    list_of_servers_from_log = list(set([row[0] for row in max_deploy_versions_ndarray]))

    # set up the level 1 keys
    for server in list_of_servers_from_log:
        max_versions_deployment_dict[server] = {}

    # enrich the max_versions_deployment_dict
    for row in max_deploy_versions_ndarray:
        max_versions_deployment_dict[row[0]].update({row[1]:row[2]})

    return max_versions_deployment_dict


# Define the directory where config files are stored
configDirectory = 'P:\\Colart\\Development\\Azure-Project\\__config\\'

# Define the target directory for sqlDevOps files
sqlDevOpsDirectory = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_sql\\'

# define the directory for sqlDevOps logging
sqlDevOpsDirectoryLog = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_log\\'

# the full path to the sqlDevopsLog file
sqlDevopsLogFilepath = f'{sqlDevOpsDirectoryLog}sqlDevopsLog.csv'

# User-Input: Parent Directory, Project Alias, Feature/Hotfix Name
parentDir = input('Type in the parent directory of the features/hotfixes location: ')
projectAlias = input('Type in the alias of the Project - e.g. Az, GDW: ')
featureName = input('Type in the exact name of the folder the sql scripts reside in - e.g. Snapshot-Feature, j408: ')

# File directory where all the sql code related to the deployment is stored
rootDir = f'{parentDir}\\{featureName}\\Server'

# use os lib to walk the dir tree and create lists of servers, dbs and filepaths 
treeDir = os.walk(rootDir)

filePathList = []
for dirpath, dirname, file in treeDir:
    if dirpath.endswith('Server'):
        serverList = dirname
    if dirpath.endswith('Database'):
        dbList = dirname
    for name in file:
        if name.endswith('.sql'):
            filePath = os.path.join(dirpath,name)
            filePathList.append(filePath)

# use the config file to replace dev server name to prod
with open(f"{configDirectory}config.json", "r") as rj:
    config = json.load(rj)
    prodServerList = [config["dev_to_prod_values"][srv] for srv in serverList]

# generate the dictionary that holds all max version values found in the log file per server per database
max_versions_deployment_dict = create_max_versions_deployment_dict(sqlDevopsLogFilepath)

# 8-int date to be appended to sql file
dateInt = time.strftime('%Y%m%d')
# 14-int datetime to be written in the log file
datetimeInt = time.strftime('%Y%m%d%H%M%S')

# create an empty list for storing the different sql depployment filenames
# will be used to create new entries in sqlDevopsLog
sqlDeploymentFileList = []
for server in serverList:
    for db in dbList:
        for item in filePathList:
            # Assign the production values to dev servers and dbs
            if server in config["dev_to_prod_values"].keys():
                newServer = config["dev_to_prod_values"][server]
            else:
                newServer = server

            # define the new deployment value
            if newServer in max_versions_deployment_dict.keys():
            	if db in max_versions_deployment_dict[newServer].keys():
                	deploy_version_value = max_versions_deployment_dict[newServer][db] + 1
            else:
                deploy_version_value = 1

            # write to file prepare the list for logging
            if item.find(f'\\{server}\\') > -1 and item.find(f'\\{db}\\') > -1 and not item.find('\\zz') > -1:
                sqlDeploymentFileName = f"sqlDevops.{newServer}.{db}.v{deploy_version_value}.{projectAlias}-{featureName}__{dateInt}.sql"
                sqlDeploymentFile = open(f"{sqlDevOpsDirectory}{sqlDeploymentFileName}","a+")
                rFileObj = open(item,"r")
                sqlRead = rFileObj.read()
                sqlDeploymentFile.write(f'-- {item}\n{sqlRead}\n\n')

                # create a tuple that will hold all deploy details and will be used to generate a distinct list of filenames deployed
                full_deploy_details_tuple = (newServer,db,deploy_version_value,datetimeInt,featureName,sqlDeploymentFileName)
                sqlDeploymentFileList.append(full_deploy_details_tuple)

# uniquify the list of sql files to be deployed
sqlDeploymentFileList = list(set(sqlDeploymentFileList))

# write to log file
with open(f"{sqlDevopsLogFilepath}", "a+") as alog:
    writer = csv.writer(alog, lineterminator="\r")
    writer.writerows(sqlDeploymentFileList)
