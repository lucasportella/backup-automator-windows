# backup-automator-windows

backup automator for machines connected into a windows shared network.

Useful for generating local backups from your windows share network. 
After the first backup is created, it will only update the backup with the network server, being must faster than creating a new backup from scratch.

## Why ?

Windows users generally uses the builtin windows interfaces for copying files. It works ok with small chunks of data, but when it comes to several gigabytes of data, backing up can be a nightmare: several prompts windows might interrupt the operation, asking questions, giving you warnings and even refusing to copying some files claiming they are "viruses".

If you want to just get the job done without all the windows super protection, you will want to use the robocopy command. This script makes it easier to control your backup, auto mounting the drives, copying the files and giving you logs of the operations.

## Requirements
- shared local network on windows machine (version 10 or 11 recommended) with the drive sharing files
- A block device such as a HDD/SSD to store your backup files. 
- another machine(windows) to backup the files

# How to use
- Download the project in your Windows computer
- Create your config.bat file based on the config-example.bat file
- Change the config.bat variables to your own.
  - **shared_dir_source** is the network path to connect to your shared local drive. You will need to find the machine local IP with the *ipconfig* command in your server or use it's network name. 
 
  - **networkDrive** is the path to where the server shared folder will be mounted on the backup computer. It's up to you to decide the path. You will have to set a letter like the C: drive. Use a letter that is not being used yet, like X or Z. Don't use A or B since they are reserved for floppy devices.
    
  - **destination_dir** is where your backup files will be in your system. Probably in your C: or D: drive.'

- Go to the project folder and execute the backup-script.bat file.
  
- You can check the logs in the path provided on your config.bat *log_dir* variable

- To make the script run on startup press "Windows button + R", type shell:startup and add a backup-script.bat shortcut in the startup folder
