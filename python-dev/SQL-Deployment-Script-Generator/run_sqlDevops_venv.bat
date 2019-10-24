@echo off

SET VENV_PATH=C:\Users\SofoklisV\.virtualenvs\Python-ETL-SNPFDiPN\Scripts
SET PY_SCRIPT_DIR_PATH=P:\GitHub\personal-dev\python-dev\SQL-Deployment-Script-Generator
SET PY_FILENAME=sqlDevOps.py

cmd /k "cd /d %VENV_PATH% & activate & cd /d %PY_SCRIPT_DIR_PATH% & python %PY_FILENAME%"