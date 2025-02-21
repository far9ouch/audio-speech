@echo off
echo Cleaning Netlify configuration and setting up GitHub Pages...

:: Remove Netlify files
del /f netlify.toml
del /f netlify.config.js
del /f netlify.sh
del /f Procfile
rmdir /s /q netlify

:: Remove Netlify-related dependencies from package.json
:: We'll create a new simplified package.json

echo {
echo   "name": "audaa",
echo   "version": "1.0.0",
echo   "description": "AUDAA Text-to-Speech Service",
echo   "scripts": {
echo     "start": "python app.py",
echo     "dev": "flask run"
echo   }
echo } > package.json

:: Create GitHub Pages configuration
echo name: Deploy to GitHub Pages > .github/workflows/deploy-pages.yml
echo. >> .github/workflows/deploy-pages.yml
echo on: >> .github/workflows/deploy-pages.yml
echo   push: >> .github/workflows/deploy-pages.yml
echo     branches: [ main ] >> .github/workflows/deploy-pages.yml
echo. >> .github/workflows/deploy-pages.yml
echo jobs: >> .github/workflows/deploy-pages.yml
echo   deploy: >> .github/workflows/deploy-pages.yml
echo     runs-on: ubuntu-latest >> .github/workflows/deploy-pages.yml
echo     steps: >> .github/workflows/deploy-pages.yml
echo       - uses: actions/checkout@v2 >> .github/workflows/deploy-pages.yml
echo. >> .github/workflows/deploy-pages.yml
echo       - name: Setup Python >> .github/workflows/deploy-pages.yml
echo         uses: actions/setup-python@v2 >> .github/workflows/deploy-pages.yml
echo         with: >> .github/workflows/deploy-pages.yml
echo           python-version: '3.9.16' >> .github/workflows/deploy-pages.yml
echo. >> .github/workflows/deploy-pages.yml
echo       - name: Install dependencies >> .github/workflows/deploy-pages.yml
echo         run: ^| >> .github/workflows/deploy-pages.yml
echo           python -m pip install --upgrade pip >> .github/workflows/deploy-pages.yml
echo           pip install -r requirements.txt >> .github/workflows/deploy-pages.yml
echo. >> .github/workflows/deploy-pages.yml
echo       - name: Deploy to GitHub Pages >> .github/workflows/deploy-pages.yml
echo         uses: peaceiris/actions-gh-pages@v3 >> .github/workflows/deploy-pages.yml
echo         with: >> .github/workflows/deploy-pages.yml
echo           github_token: ${{ secrets.GITHUB_TOKEN }} >> .github/workflows/deploy-pages.yml
echo           publish_dir: ./static >> .github/workflows/deploy-pages.yml

:: Update requirements.txt
echo flask==2.0.1 > requirements.txt
echo python-dotenv==0.19.0 >> requirements.txt
echo requests==2.26.0 >> requirements.txt
echo zyphra >> requirements.txt

:: Create .gitignore if it doesn't exist
echo # Python > .gitignore
echo __pycache__/ >> .gitignore
echo *.pyc >> .gitignore
echo venv/ >> .gitignore
echo .env >> .gitignore
echo .DS_Store >> .gitignore

echo Done! Now follow these steps:

echo 1. Go to your GitHub repository settings
echo 2. Navigate to Pages section
echo 3. Select 'gh-pages' branch as source
echo 4. Save the changes

pause 