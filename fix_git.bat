@echo off
echo Fixing Git repository setup...

:: Check current git status
echo Current Git Status:
git status

:: Check remote repositories
echo.
echo Current Remote Repositories:
git remote -v

:: Remove existing origin
git remote remove origin

:: Add new origin
git remote add origin https://github.com/far9ouch/audaa.git

:: Force update main branch
git add .
git commit -m "Setup for GitHub Pages"
git push -f origin main

echo.
echo Git repository has been fixed!
echo.
pause 