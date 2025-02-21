@echo off
echo Cleaning up project files...
echo ========================

:: Remove Netlify-related files
del /f /q netlify.toml
del /f /q netlify.config.js
del /f /q netlify.sh
del /f /q Procfile
del /f /q runtime.txt
del /f /q package.json
del /f /q setup.py
del /f /q build.py
del /f /q clean_netlify.bat
del /f /q deploy.bat
del /f /q schedule_update.bat
del /f /q .python-version
rmdir /s /q netlify 2>nul

:: Remove old GitHub workflow
del /f /q .github\workflows\deploy.yml

:: Clean up unnecessary directories
rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul
rmdir /s /q __pycache__ 2>nul
rmdir /s /q .pytest_cache 2>nul
rmdir /s /q .vscode 2>nul
rmdir /s /q .idea 2>nul

:: Update .gitignore to be simpler
echo # Python > .gitignore
echo __pycache__/ >> .gitignore
echo *.pyc >> .gitignore
echo venv/ >> .gitignore
echo .env >> .gitignore
echo .DS_Store >> .gitignore

:: Update requirements.txt to keep only necessary packages
echo flask==2.0.1 > requirements.txt
echo python-dotenv==0.19.0 >> requirements.txt
echo requests==2.26.0 >> requirements.txt
echo zyphra >> requirements.txt

echo.
echo Cleanup completed! The following files are kept:
echo - app.py
echo - requirements.txt
echo - static/
echo - templates/
echo - .gitignore
echo - .github/workflows/deploy-pages.yml
echo.
echo Project is now ready for GitHub Pages!
pause 