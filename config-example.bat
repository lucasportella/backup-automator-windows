@echo off

REM Credentials
set "system_user=mike"
set "system_password=password"

REM Log directory
set "log_dir=C:\Users\%system_user%\backup\logs"

REM Source directory
set "shared_dir_source=\\192.168.0.10\driveName"
set "networkDrive=Z:"

REM Destination directory
set "destination_dir=C:\Users\%system_user%\backup\%system_user%-destination-backup\my-backup"

echo Variables set successfully.
