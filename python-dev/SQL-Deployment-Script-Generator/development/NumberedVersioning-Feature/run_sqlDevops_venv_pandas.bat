@echo off

SET VENV_PATH=C:\Users\SofoklisV\.virtualenvs\Turn-Excel-to-CSV-4yTVT-25\Scripts
SET PY_SCRIPT_DIR_PATH=P:\GitHub\personal-dev\python-dev\SQL-Deployment-Script-Generator\Development\NumberedVersioning-Feature
SET PY_FILENAME=sqlDevOps-NumberedVersioning.py

cmd /k "cd /d %VENV_PATH% & activate & cd /d %PY_SCRIPT_DIR_PATH% & python %PY_FILENAME%"