@echo off
echo AUDAA - Auto Update Script
echo ========================

:: Set your GitHub details
set GITHUB_USERNAME=far9ouch
set GITHUB_EMAIL=far9ouc07@gmail.com
set REPO_NAME=audio-speech

:: Configure Git if not already done
git config --global user.name "%GITHUB_USERNAME%"
git config --global user.email "%GITHUB_EMAIL%"

echo.
echo Adding modified files...
git add .github/workflows/deploy.yml
git add .gitignore
git add app.py
git add netlify.toml
git add requirements.txt
git add static/style.css
git add update.bat

echo.
echo Adding new files...
git add .env.example
git add Procfile
git add deploy.bat
git add netlify/
git add package.json
git add schedule_update.bat
git add setup.bat
git add setup.py
git add static/netlify.js

echo.
echo Current status:
git status

echo.
set /p COMMIT_MSG="Enter commit message (or press Enter for default): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG="Update project structure and deployment configuration"

:: Commit changes
git commit -m "%COMMIT_MSG%"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo Update completed successfully!
echo ========================
timeout /t 5 