# Generate new Arm Template for ADF Deployments


## Files

- GenerateNewArmTemplateForDeployment
	+ The python code
- config
	+ A dictionary with important configuration regarding the replacement or enrichment of values
	in the arm_template

## Version Control:

Author: Sofoklis Vourekas
Date: 19 July 2019
Release History:

- 0.1.1 - 06 September 2019
	+ Fixed bug in function 'findalldependencies'- function was executing forever
	+ Inserted comment inside the code

- 0.1.0 - 19 July 2019
	+ First proper release

## Reason for Development:

Azure Data Factory has a cool feature called 'Export ARM Template'. Essentially what this does, is to create a JSON file that contains the full code for everything the Data Factory contains (pipelines, datastets, linked services, integration runtimes etc...).

This arm_template file can be used to deploy the configuration of the data factory to other environments (e.g. DEV --> PROD).

There are a few of issues that this script is trying to address:
As of 2019-07-19, Azure Data Factory does not let you pick specific resources for deployment, neither auto-fills connection strings. Additionally, Integration Runtimes have a unique characterization across environments and they become the reason of many failed attempts to deploy.

## How it works

The script is developed to tackle pipeline deployments.
You must have python 3.7 installed on the machine.
Assumption is you are deploying from BIDataFactoryDev to another environment.

	1. Place the script in the same folder the arm_templates is saved into
	2. Copy the precise name of the pipeline you want to deploy
	3. Run the script
		3.1. The script will ask you for the pipeline name
		3.2. Choose the Data Factory environment you are deploying into.
	4. The script will generate 2 JSON files, a new arm_template called "NewDataFactoryDeploymentFile_{name_of_DF}.json" and a new arm_template_parameters called "NewDataFactoryDeploymentFile_{name_of_DF}_parms.json", both required for powershell deployment

## Notes and Future Considerations

Since this script was developed to address specific problems within the Colart AzureM3 Data Integration Project, and in particular issues that are native to BIDataFactoryDev and BIDataFactoryLive resources, a lot of tailored approaches were had to be made.

In the config.json file there are key:value pairs that fix these issues. Hence for future expansion, take a look at the config.json and see if by adding new key:value pairs can help you with the generation of the correct deployment file.

## Future Development

Extract arm_template files from both DEV and PROD environments and use the PROD to reconcile DEV and then deploy

