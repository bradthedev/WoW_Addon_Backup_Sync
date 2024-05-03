@echo off
set "backupDir=T:\WoWAddonBackup"
set "wowDir=C:\World of Warcraft\_retail_"
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"

for /f "delims=" %%a in ('dir /b /o-d "%backupDir%"') do (
    set "latest=%%a"
    goto :foundLatest
)
:foundLatest
set "latestWithoutZip=%latest:.zip=%"

echo %latestWithoutZip%

xcopy /s /e /y "%backupDir%\%latest%" "%wowDir%" || (echo "xcopy failed." && exit /b 1)

"%sevenZipPath%" x "%wowDir%\%latest%" -o"%wowDir%" -aoa || (echo "7z extraction failed." && exit /b 1)

del /q "%wowDir%\%latest%" || (echo "del failed." && exit /b 1)

rd /s /q "%wowDir%\WTF"
rd /s /q "%wowDir%\Interface"

xcopy /s /e /y "%wowDir%\%latestWithoutZip%\*" "%wowDir%" || (echo "xcopy failed." && exit /b 1)

rd /s /q "%wowDir%\%latestWithoutZip%" || (echo "del failed." && exit /b 1)

exit /b 0

pause