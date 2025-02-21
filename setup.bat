@echo off
echo Setting up AUDAA development environment...

:: Create virtual environment
python -m venv venv

:: Activate virtual environment
call venv\Scripts\activate

:: Install dependencies
pip install -r requirements.txt

:: Install development dependencies
pip install pylint black pytest

:: Install Node.js dependencies
npm install

echo Setup completed successfully!
pause 