@echo off
echo Creating scheduled task for AUDAA updates...

:: Create a scheduled task that runs every day at midnight
schtasks /create /tn "AUDAA GitHub Update" /tr "%~dp0update.bat" /sc daily /st 00:00

echo Scheduled task created successfully!
pause 