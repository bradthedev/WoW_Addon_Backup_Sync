@echo off
SET Timestamp=%date:~4,2%%date:~7,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%
SET "Timestamp=%Timestamp: =0%"

SET wtfDir="C:\World of Warcraft\_retail_\WTF"
SET interfaceDir="C:\World of Warcraft\_retail_\Interface"
SET tempDir="D:\WoWBackUp\%timestamp%"
SET destDir="\\TOWER\NasBackup\WoWAddonBackup"

echo Creating temporary backup directory...
mkdir %tempdir% || (echo "Failed to create temporary backup directory." && exit /b 1)
echo.
echo Copying Interface directory to temporary backup directory...
robocopy %interfaceDir% "%tempdir%\Interface" /NFL /MIR /MT:32 || (echo "Failed to copy Interface directory." && exit /b 1)
echo.
echo Copying WTF directory to temporary backup directory...
robocopy %wtfDir% "%tempdir%\WTF" /NFL /MIR /MT:32 || (echo "Failed to copy WTF directory." && exit /b 1)

CD /D "C:\Program Files\7-Zip"

echo.
echo Compressing temporary backup directory...
7z.exe a -mmt=16 "%tempDir%.zip" "%tempDir%" -r || (echo "Failed to compress temporary backup directory." && exit /b 1)

echo.
echo Removing temporary backup directory...
rmdir /s /q %tempdir% || (echo "Failed to remove temporary backup directory." && exit /b 1)

echo.
echo Copying backup to destination directory...
robocopy "D:\WoWBackUp" "%destDir%" /NFL /COPY:DAT /MT:32 /R:1 /W:1 /NP || (echo "Failed to copy backup to destination directory." && exit /b 1)

echo.
echo Backup process completed successfully.
pause
exit /b 0