'''
Parse the DDL SQL file and extract all the CREATE TABLE statements 
that refer to the values of maxmast key inside the config.json file

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

Since the execution of this script will prepare a sql file
to be run from the command line, it needs to be prepared
in such a way that will drop a table if already exists. See
DROP_STATEMENT parameter below.
'''

import json
import os
import shutil
from io import StringIO

# The main purpose of file below is to store the names of all tables
# to be used in this script
with open("config.json", "r") as rj:
    config = json.load(rj)
# This file is where all the definitions of the maxmast db are stored
with open("test.sql", "r") as rs:
    maxmastddlfile = rs.read()

# Declare global parameters
START_PATTERN = 'create table "maxmast".'
END_PATTERN = ');'
SCHEMA_STAGE = 'stage'
SCHEMA_TYPED = 'typed'
# list of tables from the config file
LIST_OF_TABLES = config["maxmastTables"]


###################################################################
########################### Start of Code #########################

# First delete file from previous runs if exists
if os.path.exists("maxmastDDLstage.sql"):
    os.remove("maxmastDDLstage.sql")
if os.path.exists("maxmastDDLtyped.sql"):
    os.remove("maxmastDDLtyped.sql")

# create a dict that will hold the ddl statements for the
# tables as they appear in the in the maxmast backup ddl file.
# This resource can be used both for typed and stage
ddl = {}
for tablename in LIST_OF_TABLES:
    # for each of the tables build sql start pattern
    START_PATTERN_table = START_PATTERN + tablename
    # find starting index in sql file (now stored in memory)
    startindex = maxmastddlfile.find(START_PATTERN_table)
    # find end index of sql ddl pattern
    endindex = maxmastddlfile.find(END_PATTERN, startindex)
    # extract the substring by python slicing
    ddlstatement = maxmastddlfile[startindex:endindex + 1]
    # Populate dictionary - Key=tablename, value=ddlstatement
    ddl[tablename] = ddlstatement

# Using the above dict as a resource create separate dictionaries
# for stage and typed. Prepare the statements so that they are
# ready to be run on the on sql/azure

# Cleaning and Enriching the DDL dict
for tablename in LIST_OF_TABLES:
    # both stage and typed
    mssql_prep1 = ddl[tablename].replace(" default ' '", '')
    mssql_prep2 = mssql_prep1.replace('not null', 'null')
    ddl[tablename] = mssql_prep2

# the following step is needed because variables in Python
# are just names pointing to a value in a memory location.
# With the following trick we distinguish between the two
# dictionaries as separate python objects
ddlstage = {}
for tablename in LIST_OF_TABLES:
    ddlstage[tablename] = ddl[tablename]
ddltyped = ddl

for tablename in LIST_OF_TABLES:
    # stage
    mssql_prepstage1 = ddlstage[tablename].replace('"maxmast"', 'stage')
    ddlstage[tablename] = mssql_prepstage1
    # typed - the enrichment will be finished for type dafter this step
    mssql_preptyped1 = ddltyped[tablename].replace('"maxmast"', 'typed')
    mssql_preptyped2 = mssql_preptyped1.replace(' char', ' nvarchar')
    mssql_preptyped3 = mssql_preptyped2.replace(' serial', ' nvarchar(50)')
    # mssql_preptyped4 = mssql_preptyped3.replace(' float',' numeric(15,4)')
    mssql_preptyped4 = mssql_preptyped3.replace(' smallfloat', ' float')
    ddltyped[tablename] = mssql_preptyped4
    # Prepare the drop statement for the typed schema
    schema = SCHEMA_TYPED
    DROP_STATEMENT = '''
IF EXISTS (
SELECT table_schema, table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = \'{schema}\'
    AND table_name = \'{tablename}\'
)
BEGIN
DROP TABLE {schema}.{tablename}
END
GO
    '''.format(schema=schema, tablename=tablename)
    # Enrich the value of the key
    ddltyped[tablename] = DROP_STATEMENT + \
        '\n' + ddltyped[tablename] + '\nGO\n'
    # Open a StringIO object and write to file
    out_typed = StringIO()
    out_typed.write(ddltyped[tablename])
    with open('maxmastDDLtyped.sql', 'a+') as fd:
        out_typed.seek(0)
        shutil.copyfileobj(out_typed, fd)
    out_typed.close()

# stage - Special enrichment block for the stage schema. DDL statement has to
# be edited line by line
for tablename in LIST_OF_TABLES:
    # break ddl string saved in the dict into separate lines for parsing
    sqllines = ddlstage[tablename].splitlines(keepends=True)
    # find the substring where the datatypes are stored in the ddl
    # statements and replace with nvarchar(400)
    ddl3 = []
    for line in sqllines[2:-1]:
        startindex = line.find(' ', 4)
        endindex = line.find(' ', startindex + 1)
        ddl3.append(line[:startindex] + ' nvarchar(400)' + line[endindex:])

    sqllines[2:-1] = ddl3
    sqllines.append('\nGO\n')
    # join the lines from the list back together into a string
    newddlstatement = ''.join(sqllines)
    # replace the old ddl statement with the concat of the drop statement
    # and the new enriched one
    schema = SCHEMA_STAGE
    DROP_STATEMENT = '''
IF EXISTS (
SELECT table_schema, table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = \'{schema}\'
    AND table_name = \'{tablename}\'
)
BEGIN
DROP TABLE {schema}.{tablename}
END
GO
    '''.format(schema=schema, tablename=tablename)

    ddlstage[tablename] = DROP_STATEMENT + '\n' + newddlstatement
    # clean the cache
    sqllines = []
    newddlstatement = ''

for tablename in LIST_OF_TABLES:
    out_stage = StringIO()
    out_stage.write(ddlstage[tablename])

    with open('maxmastDDLstage.sql', 'a+') as fd:
        out_stage.seek(0)
        shutil.copyfileobj(out_stage, fd)

    out_stage.close()
