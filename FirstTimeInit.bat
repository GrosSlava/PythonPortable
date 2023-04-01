@echo off



set EnvName=PyEnv


:begin
if exist %EnvName% (
    echo Already installed!
    goto end
)

rem Create environment main dir
mkdir %EnvName%
cd %EnvName%

rem Create tmp dir
mkdir tmp

rem Copy needed content 
xcopy /S /E "..\Install\Scripts\" "."

rem Reset Windows main variables
set APPDATA=%~dp0%EnvName%\tmp
set TEMP=%~dp0%EnvName%\tmp
set USERPROFILE=%~dp0%EnvName%\tmp

rem Install Git
echo Installing Git...
tar -xf "..\Install\git2.40.zip"
set GIT=%~dp0%EnvName%\git\cmd\git.exe

rem Install Python
echo Installing Python...
tar -xf "..\Install\python3.10.zip"
set PYTHON=%~dp0%EnvName%\python\python.exe

rem Clear all other system paths
set PATH=%~dp0%EnvName%\git\cmd\;%~dp0%EnvName%\python\

rem Create environment
echo Creating environment...
python -m venv venv
set VENV_DIR=%~dp0%EnvName%\venv
call "venv\Scripts\activate.bat"

rem Install needed tools
echo "------------------Tools-----------------"
python -m pip install --upgrade pip
echo "----------------------------------------"

rem Install requirements
pip install -r ..\Install\Requirements.txt

rem Show versions
echo "------------Current veriosns------------"
python -V
pip -V
pip list
echo "----------------------------------------"

:end
pause
