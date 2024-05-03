# WoW Addons Backup and Update
I created these scripts to help me with keeping my addons updated on my laptop from my PC addon settings. This has been helpful for quickly syncing addons between PCs or as I have, seting up a scheduled task to allow auto backup of your wow addons to a different folder. Feel free to modify these files to your specific use cases.

*Note: Make sure to configure the directory paths within the scripts according to your system setup.*

## Backup WoW Addons
- **backup_wow.bat**: Run this script on the host PC where all your World of Warcraft addons will be updated from. This is the main PC you play wow on. This script performs the following tasks:
  - Creates a timestamp for the backup folder.
  - Sets directories for WoW Interface, WTF (configuration), temporary backup, and destination backup.
  - Creates a temporary backup directory.
  - Uses Robocopy to mirror the Interface and WTF directories to the temporary backup directory.
  - Compresses the temporary backup directory using 7-Zip.
  - Removes the temporary backup directory.
  - Copies the compressed backup to the destination directory using Robocopy.

### Usage
1. Open Command Prompt.
2. Navigate to the directory containing `backup_wow.bat`.
3. Run `backup_wow.bat`.

---

## Update WoW Addons (Windows)
- **update-wow-addons.bat**: Windows version for updating your local machine's addons from the remote zip. This script accomplishes the following:
  - Sets directories for the backup and WoW installation directories, along with the path to 7-Zip executable.
  - Finds the latest backup zip file in the specified backup directory.
  - Extracts the zip file into the WoW installation directory.
  - Deletes the extracted zip file and clears the Interface and WTF directories.
  - Copies the contents of the extracted directory to the WoW installation directory.

### Usage
1. Open Command Prompt.
2. Navigate to the directory containing `update-wow-addons.bat`.
3. Run `update-wow-addons.bat`.

---

## Update WoW Addons (Mac)
- **update-wow-addons.command**: Mac version for updating your local machine's addons from the remote zip. This script performs the following tasks:
  - Sets directories for the backup and WoW installation directories.
  - Finds the latest backup zip file in the specified backup directory.
  - Copies the latest backup zip file to the WoW installation directory using rsync.
  - Unzips the copied file into the WoW installation directory.
  - Deletes the copied zip file and clears the Interface and WTF directories.
  - Copies the contents of the unzipped directory to the WoW installation directory.

### Usage
1. Open Terminal.
2. Navigate to the directory containing `update-wow-addons.command`.
3. Run `./update-wow-addons.command`.

---


