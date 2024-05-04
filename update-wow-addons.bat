@echo off
set "backupDir=T:\WoWAddonBackup"
set "wowDir=C:\World of Warcraft\_retail_"
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"

echo Finding latest backup file...
for /f "delims=" %%a in ('dir /b /o-d "%backupDir%"') do (
    set "latest=%%a"
    goto :foundLatest
)
:foundLatest
set "latestWithoutZip=%latest:.zip=%"

echo Latest backup file: %latestWithoutZip%

echo Copying backup to WoW directory...
xcopy /s /e /y "%backupDir%\%latest%" "%wowDir%" || (echo "xcopy failed." && exit /b 1)

echo Extracting backup...
"%sevenZipPath%" x "%wowDir%\%latest%" -o"%wowDir%" -aoa || (echo "7z extraction failed." && exit /b 1)

echo Deleting extracted zip file...
del /q "%wowDir%\%latest%" || (echo "del failed." && exit /b 1)

echo Removing Interface and WTF directories...
rd /s /q "%wowDir%\WTF"
rd /s /q "%wowDir%\Interface"

echo Copying addons to WoW directory...
xcopy /s /e /y "%wowDir%\%latestWithoutZip%\*" "%wowDir%" || (echo "xcopy failed." && exit /b 1)

echo Cleaning up...
rd /s /q "%wowDir%\%latestWithoutZip%" || (echo "del failed." && exit /b 1)

echo Update completed successfully.
exit /b 0