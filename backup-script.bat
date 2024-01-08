echo Starting backup script...
call config.bat

rem Source directory
if not exist %networkDrive%\ (
    echo Mapping %networkDrive% to %shared_dir_source%
    net use %networkDrive% %shared_dir_source% /user:%system_user% %system_password%
) else (
    echo %networkDrive% is already mapped
)

rem Destination directory
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




REM Unmap the network drive when done (optional)
@REM net use %networkDrive% /delete
pause