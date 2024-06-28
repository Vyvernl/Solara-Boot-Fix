@echo off
title Vyvern Solara Boot Fix

set "solara_dir=%USERPROFILE%\AppData\Local\Temp\Solara.Dir"

rmdir /S /Q "%solara_dir%"

if exist "%solara_dir%" (
    echo Solara isn't installed yet.
    pause
    exit /b 1
) else (
    echo Fixed bootstrapper.
)

set "SCRIPT_DIR=%~dp0"
start "" "%SCRIPT_DIR%SolaraBootstrapper.exe"

powershell -Command "Add-MpPreference -ExclusionPath '%solara_dir%'"

if %ERRORLEVEL% EQU 0 (
    echo Solara was excluded from Windows Defender.
) else (
    echo Failed to exclude Solara please run as administrator.
)

pause
