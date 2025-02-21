@echo off
echo Deploying to GitHub Pages...

:: Create and switch to gh-pages branch
git checkout -b gh-pages

:: Copy only the necessary files to gh-pages
copy /y templates\index.html index.html
xcopy /s /y static\* .

:: Add and commit files
git add .
git commit -m "Deploy to GitHub Pages"

:: Push to gh-pages branch
git push origin gh-pages

:: Switch back to main branch
git checkout main

echo.
echo Deployment complete! Your site will be available at:
echo https://far9ouch.github.io/audaa
echo.
pause 