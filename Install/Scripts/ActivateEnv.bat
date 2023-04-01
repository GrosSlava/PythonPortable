rem Copyright (c) 2023 GrosSlava
@echo off



set APPDATA=%~dp0tmp
set USERPROFILE=%~dp0tmp
set TEMP=%~dp0tmp
set PYTHON=%~dp0python\python.exe
set GIT=%~dp0git\cmd\git.exe
set VENV_DIR=%~dp0venv
set PATH=%~dp0git\cmd\;%~dp0python\python\

call "%~dp0venv\Scripts\activate.bat"