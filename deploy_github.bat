@echo off
echo Deploying to GitHub Pages...

:: Ensure we're on main branch
git checkout main

:: Create and switch to gh-pages branch (delete if exists)
git branch -D gh-pages
git checkout -b gh-pages

:: Remove unnecessary files from gh-pages
del /f /q .gitignore
del /f /q requirements.txt
del /f /q app.py
del /f /q *.bat
rmdir /s /q __pycache__ 2>nul
rmdir /s /q venv 2>nul

:: Copy index.html to root
copy /y templates\index.html index.html
rmdir /s /q templates

:: Commit and push gh-pages
git add -A
git commit -m "Deploy to GitHub Pages"
git push -f origin gh-pages

:: Switch back to main branch
git checkout main

echo.
echo Deployment complete! Your site will be available at:
echo https://far9ouch.github.io/audaa
echo.
echo Please wait a few minutes for GitHub Pages to update.
pause 