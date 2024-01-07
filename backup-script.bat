@echo off
echo Starting backup script...
rem call config.bat

setlocal enabledelayedexpansion

echo Countdown from 10 seconds:

for /l %%i in (5,-1,1) do (
    echo !%%i! seconds remaining
    timeout /nobreak /t 1 >nul
)

echo Blast off!