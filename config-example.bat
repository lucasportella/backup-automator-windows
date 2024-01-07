@echo off
setlocal enabledelayedexpansion

REM Credentials
set "system_user=mike"
set "samba_user=john" REM not best practice, samba_user should be the same as system_user
set "samba_password=password"

REM Log directory
set "log_dir=C:\Users\%system_user%\logs"

REM Source directory
set "shared_dir_source=\\mike-mikepc12345.local\sambashare"
set "shared_dir_mount_target=C:\Users\%system_user%\backup\shared-folder"

REM Destination directory
set "destination_mount_device_location=\\?\Volume{Volume GUID}"
set "destination_dir=C:\Users\%system_user%\backup\%system_user%-destination-backup\my-backup"

echo Variables set successfully.
