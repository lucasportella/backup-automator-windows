echo Starting backup script...
call config.bat

rem Check if the network drive exists
if not exist %networkDrive%\ (
    echo Mapping %networkDrive% to %shared_dir_source%
    net use %networkDrive% %shared_dir_source% /user:%system_user% %system_password%
) else (
    echo %networkDrive% is already mapped
)


REM Unmap the network drive when done (optional)
@REM net use %networkDrive% /delete
pause