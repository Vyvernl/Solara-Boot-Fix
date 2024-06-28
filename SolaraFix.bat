@echo off
title Solara Bootstrapper Fix
REM Delete the specified folder and its contents
rmdir /S /Q "C:\Users\vyver\AppData\Local\Temp\Solara.Dir"

REM Check if the deletion was successful
if exist "C:\Users\vyver\AppData\Local\Temp\Solara.Dir" (
    echo Solara isn't installed yet.
    pause
    exit /b 1
) else (
    echo Fixed bootstrapper.
)

REM Run the SolaraBootstrapper file from the same directory as this script
set "SCRIPT_DIR=%~dp0"
start "" "%SCRIPT_DIR%SolaraBootstrapper"

REM Optionally, pause to keep the command prompt window open
pause
