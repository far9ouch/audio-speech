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
echo Adding configuration files...
git add .python-version
git add netlify.config.js
git add runtime.txt
git add .github/workflows/deploy.yml
git add netlify.toml
git add package.json
git add requirements.txt
git add setup.py
git add netlify.sh

:: Make netlify.sh executable
git update-index --chmod=+x netlify.sh

echo.
echo Current status:
git status

echo.
set /p COMMIT_MSG="Enter commit message (or press Enter for default): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG="Fix Python installation in Netlify build"

:: Commit changes
git commit -m "%COMMIT_MSG%"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo Update completed successfully!
echo ========================
timeout /t 5 