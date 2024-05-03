@echo off
SET Timestamp=%date:~4,2%%date:~7,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%
SET "Timestamp=%Timestamp: =0%"

SET wtfDir="C:\World of Warcraft\_retail_\WTF"
SET interfaceDir="C:\World of Warcraft\_retail_\Interface"
SET tempDir="D:\WoWBackUp\%timestamp%"
SET destDir="\\TOWER\NasBackup\WoWAddonBackup"

mkdir %tempdir%
robocopy %interfaceDir% "%tempdir%\Interface" /NFL /MIR /MT:32
robocopy %wtfDir% "%tempdir%\WTF" /NFL /MIR /MT:32

CD /D "C:\Program Files\7-Zip"

7z.exe a -mmt=16 "%tempDir%.zip" "%tempDir%" -r

rmdir /s /q %tempdir%

robocopy "D:\WoWBackUp" "%destDir%" /NFL /COPY:DAT /MT:32 /R:1 /W:1 /NP
