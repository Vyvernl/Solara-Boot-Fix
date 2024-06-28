@echo off
title Solara Bootstrapper Fix

REM Define the folder path dynamically using the USERPROFILE environment variable
set "solara_dir=%USERPROFILE%\AppData\Local\Temp\Solara.Dir"

REM Delete the specified folder and its contents
rmdir /S /Q "%solara_dir%"

REM Check if the deletion was successful
if exist "%solara_dir%" (
    echo Solara isn't installed yet.
    pause
    exit /b 1
) else (
    echo Fixed bootstrapper.
)

REM Run the SolaraBootstrapper.exe file from the same directory as this script
set "SCRIPT_DIR=%~dp0"
start "" "%SCRIPT_DIR%SolaraBootstrapper.exe"

REM Add the folder exclusion to Windows Defender
powershell -Command "Add-MpPreference -ExclusionPath '%solara_dir%'"

REM Check if the exclusion was added successfully
if %ERRORLEVEL% EQU 0 (
    echo Solara was excluded from Windows Defender.
) else (
    echo Failed to exclude Solara please run as administrator.
)

REM Optionally, pause to keep the command prompt window open
pause
