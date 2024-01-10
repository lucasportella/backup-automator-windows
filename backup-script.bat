echo Starting backup script...
call config.bat

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

echo Variables created.

echo starting robocopy command...
rem You can add /MIR parameter to make an exact copy of the source, but if you set the wrong path it will result in data loss.
robocopy %shared_dir_source% %destination_dir% /XO /R:2 /W:5 /FFT /E /TEE /LOG:%log_dir%"\log.txt"




REM Unmap the network drive when done (optional)
REM net use %networkDrive% /delete

echo backup script finished.
pause