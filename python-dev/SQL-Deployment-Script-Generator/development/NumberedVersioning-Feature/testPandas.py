import os
from os.path import join
import pandas as pd
import time

'''
What I want is to start the program with a dictionary that will hold the max
versions of deployments for each of the databases per server.

The dictionary will be used to determine the new numbered version.

If a deployment is new and there is no past version it will have to create
a new entry.

max_versions_deployment_dict =
{
	'server1': {
		'db1': 1
	},
	'server2': {
		'db2': 2,
		'db3': 3
	}
}
'''

# Define the target directory for sqlDevOps files
sqlDevOpsDirectory = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_sql\\'

# Define the directory for sqlDevOps logging
sqlDevOpsDirectoryLog = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_log\\'

parentDir = 'P:\\Colart\\Development\\Azure-Project'
featureName ='MaxIntegration-Feature'
# File directory where all the sql code related to the deployment is stored
rootDir = f'{parentDir}\\{featureName}'

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

devopslog = pd.read_csv(f'{sqlDevOpsDirectoryLog}sqlDevopsLog.csv', usecols = ['server', 'database', 'version'])

maxversionaggr = {
	'server': 'max',
	'database': 'max',
	'version' : 'max'
	}

ndarray = devopslog.loc[devopslog['database'] == 'stakgendb'].agg(maxversionaggr).values

for item in ndarray:
	print(item)