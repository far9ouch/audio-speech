@echo off
echo Deploying to Netlify...

:: Load environment variables
set /p NETLIFY_AUTH_TOKEN=<netlify.env
set /p NETLIFY_SITE_ID=<netlify.env

:: Deploy to Netlify
netlify deploy --prod

echo Deployment completed!
pause 