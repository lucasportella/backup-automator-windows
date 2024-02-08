echo Starting backup script...

call config.bat

setlocal EnableDelayedExpansion

rem Source drive directory
if not exist %networkDrive%\ (
    echo Mapping %networkDrive% to %shared_dir_source%
    net use %networkDrive% %shared_dir_source% /user:%system_user% %system_password%
) else (
    echo %networkDrive% is already mapped
)

rem Destination drive directory
if exist %destination_dir% (
    echo "Destination directory already exists."
) else (
    mkdir %destination_dir%
)

rem Log directory
if exist %log_dir% (
    echo "Log directory already exists."
) else (
    mkdir %log_dir%
)

rem Delete log files older than 60 days
forfiles /p %log_dir% /m *.txt /d -60 /c "cmd /c del @path"

REM Get the current date and time
for /f %%a in ('wmic os get localdatetime ^| find "."') do set "datetime=%%a"

REM Extract year, month, day, hour, and minute from the datetime variable
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"

REM Create the desired timestamp format
set "timestamp=!year!-!month!-!day!-!hour!-!minute!"

echo Variables created.

echo starting robocopy command...
rem You can add /MIR parameter to make an exact copy of the source, but if you set the wrong path it will result in data loss.
robocopy %shared_dir_source% %destination_dir% /XO /R:2 /W:5 /FFT /E /TEE /LOG:%log_dir%"\%timestamp%.txt"

REM Unmap the network drive when done (optional)
REM net use %networkDrive% /delete

echo backup script finished.
