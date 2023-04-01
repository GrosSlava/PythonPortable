@echo off



:begin
call ActivateEnv.bat

if exist Requirements.txt (pip install -r Requirements.txt)
if exist requirements.txt (pip install -r requirements.txt)

pip list

:end
pause