@echo off
echo Updating AUDAA Text-to-Speech Application...

:: Pull latest changes from GitHub
git pull origin main

:: Install/Update dependencies
pip install -r requirements.txt

:: Clear Python cache
del /s /q __pycache__
del /s /q *.pyc

:: Restart Flask application (if running)
taskkill /f /im python.exe /fi "windowtitle eq AUDAA*"
start "AUDAA Server" python app.py

echo Update completed successfully!
pause 