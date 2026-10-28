ECHO OFF
setlocal enabledelayedexpansion

:: Check for admin rights
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    goto :getAdmin
)

:getAdmin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:runScript
net stop winmgmt /y
cls
net start winmgmt /y
cls


echo Press any key to execute the command again.
pause>nul
goto runScript