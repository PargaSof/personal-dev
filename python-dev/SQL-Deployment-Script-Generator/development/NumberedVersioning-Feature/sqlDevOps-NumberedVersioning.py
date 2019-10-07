import os
from os.path import join
import csv
import time

# Define the target directory for sqlDevOps files
sqlDevOpsDirectory = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_sql\\'

# Define the directory for sqlDevOps logging
sqlDevOpsDirectoryLog = 'P:\\Colart\\Development\\Azure-Project\\__deployments\\_log\\'

# Ask user to insert the Parent Directory
parentDir = input('Type in the parent directory of the features/hotfixes location: ')

# Ask user to insert the Project Alias
projectAlias = input('Type in the alias of the Project - e.g. Az, GDW: ')

# Ask user to insert the Feature/Hotfix Name
featureName = input('Type in the exact name of the folder the sql scripts reside in - e.g. Snapshot-Feature, j408: ')

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

# print(f'Servers are: {serverList}\n')

# print(f'DBs are: {dbList}\n')

# print(f'File paths are: {filePathList}')

dateInt = time.strftime('%Y%m%d')

for server in serverList:
	for db in dbList:
		for item in filePathList:
			# Assign the production values to dev servers and dbs
			if server == 'bistakgendbdev':
				newServer = 'bistakgendblive'
			if server == 'UK-LD9-BA2':
				newServer = 'UK-LD9-BA1'
			if item.find(f'\\{server}\\') > -1 and item.find(f'\\{db}\\') > -1:
				sqlDeploymentFile = open(f"{sqlDevOpsDirectory}sqlDevops.{newServer}.{db}.v001.{projectAlias}-{featureName}__{dateInt}.sql","a+")
				rFileObj = open(item,"r")
				sqlRead = rFileObj.read()
				sqlDeploymentFile.write(f'-- {item}\n{sqlRead}\n\n')

'''
Metadata Log - Control CI/CD
'''

# serverList
# dbList
# filePathList

with open(f'{sqlDevOpsDirectoryLog}sqlDevopsLog.csv', 'r', newline='') as rcsv:
	sqlDevopsLogFile = csv.DictReader(rcsv, delimiter = ',')

	# for db in dbList:
	# 	versionNumList = []
	for line in sqlDevopsLogFile:
		if line['database'] == dbName:
			# versionNumList.append(line['version'])
			print(line['version'])
		# print(f'{db}: {versionNumList}')
		# maxVersionNum = {db: max(versionNumList)}

time.sleep(10)