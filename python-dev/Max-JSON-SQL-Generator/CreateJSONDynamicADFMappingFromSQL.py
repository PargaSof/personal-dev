import json
import os

with open("config.json", "r") as rj:
	config = json.load(rj)

with open("test.sql","r") as rs:
	maxtablesddl = rs.read()

# Parse the DDL SQL file and extract all the CREATE TABLE statements that refer to the values of maxmast key inside the config.json file

'''

/****** example of SQL pattern *******/

create table "maxmast".imacc 
(
	col1 varchar(0) not null ,
	col2 float not null ,
	col3 char(10) null ,
	...
	coln float not null
);

/*************************************/

'''

'''
Here it could be the start of a function that will produce the column names for each of the tables

Output is a dictionary with keys being tablenames and value all the respective columnnames
'''

startofpattern = 'create table "maxmast".'
endofpattern = ');'

# list o ftables from the config file
listoftables = config["maxmastTables"]

# create the empty dictionary where all the ddl statements will be saved into
ddl_dict = {}
# populate the dict
for tablename in listoftables:
	startofpattern_table = startofpattern + tablename
	startindex = maxtablesddl.find(startofpattern_table)
	endindex = maxtablesddl.find(endofpattern,startindex)

	ddl_dict[tablename] = maxtablesddl[startindex:endindex+2]

# new dictionary that will only hold the columns for each table
columns_dict ={}
for tablename in listoftables:
	tablecolumns_raw = ddl_dict[tablename].splitlines() # stores each line as an item in a list

	# produce a list of the lines that contain the column names from the sql script
	tablecolumns_clean1 = []
	for item in tablecolumns_raw:
		tablecolumns_clean1.append(item.lstrip()) # clean the string from spaces at the left

	# isolate the columnnames and save them in a list
	tablecolumns_clean2=[]
	for item in tablecolumns_clean1:
		breakindex = item.find(' ')
		tablecolumns_clean2.append(item[:breakindex])

	#  What follows is the dictionary that each key is a table from the maxmast file and the value are distinct tablenames
	columns_dict[tablename] = tablecolumns_clean2[2:-1]
	
	# for x in tablecolumns_clean2[2:-1]:
	# 	if 'default' in x:
	# 		print(x)
# print(columns_dict)

'''
End of function 
'''

'''
Start of new function - Create the JSON Code for the the Dynamic ADF Mapping
Start of new function - Create the SQL file to write all the new rows into the control table

JSON Pattern per column:

{
	"source": {
		"type": "String",
		"ordinal": 1
	},
	"sink": {
		"name": "imacc_item"
	}
}

'''
# First delete files from previous runs
if os.path.exists("InsertNewRowsIntoControlTable_CrownMax.sql"):
	os.remove("InsertNewRowsIntoControlTable_CrownMax.sql")

if os.path.exists("DynamicADFMappingJSON.json"):
	os.remove("DynamicADFMappingJSON.json")
	
# Create the file with the JSON code for each of the tables in the config.json file 
for tablename in listoftables:
	mappingJSON_dict3 = {}
	mappingJSON_dict2 = {"type": "TabularTranslator"}
	mappingJSON_list1 = []	
	for i, columnname in enumerate(columns_dict[tablename]):
		mappingJSON_dict1 = {}
		mappingJSON_dict1["source"] = {"type": "String","ordinal": i+1}
		mappingJSON_dict1["sink"] = {"name": columnname}
		mappingJSON_list1.append(mappingJSON_dict1)
	
	mappingJSON_dict2["mappings"] = mappingJSON_list1
	mappingJSON_dict3[tablename] = mappingJSON_dict2
	tobewrittentofile = json.dumps(mappingJSON_dict3)
	sqltobewrittentofile = json.dumps(mappingJSON_dict3[tablename])
	sqltobewrittentofile_replacequote = sqltobewrittentofile.replace("'",'"')

	# Prepare the SQL file that will insert the rows into the control table
	startSQLinsert = 'INSERT INTO [control].[AllTablesLoadTypeCrownDB] (TableName, Active, USPName, MappingCodeJSON, UNLFileName)'
	SQLinsertlist = []
	UNLfilename = tablename[:5]

	insertvalues = "VALUES('{tablename}',0,'n/a','{json}','{unl}')".format(tablename=tablename, json=sqltobewrittentofile_replacequote, unl=UNLfilename)
	SQLinsertlist.append(insertvalues)

	# write to file - full sql
	with open("InsertNewRowsIntoControlTable_CrownMax.sql", "a+") as ws:
		for item in SQLinsertlist:
			ws.write(startSQLinsert + ' ' + item)
			ws.write('\n\n')

	# write to file - plain json code
	with open("DynamicADFMappingJSON.json", "a+") as wj:
		wj.write(tobewrittentofile)
		wj.write('\n\n\n')


