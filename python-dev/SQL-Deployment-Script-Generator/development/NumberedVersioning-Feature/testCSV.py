import os
from os.path import join
import csv
import time

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

for db in dbList:
    print(db)
    with open(f'{sqlDevOpsDirectoryLog}sqlDevopsLog.csv', 'r', newline='') as rcsv:
        sqlDevopsLogFile = csv.DictReader(rcsv, delimiter = ',')

        for line in sqlDevopsLogFile:
            versionNumList = []
            if line['database'] == db:
                versionNumList.append(line['version'])
            
            print(f'{db}: {versionNumList}')

            