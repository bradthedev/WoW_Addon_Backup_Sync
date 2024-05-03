backupDir="/Volumes/NasBackup/WoWAddonBackup"
wowDir="/Applications/World of Warcraft/_retail_"

latest=$(ls -t "$backupDir" | head -n1)
latestWithoutZip=$(echo "$latest" | sed 's/.zip//g')

echo "$latestWithoutZip"

rsync -v -r "$backupDir/$latest" "$wowDir" || { echo "rsync failed."; exit 1; }

unzip -o "$wowDir/$latest" -d "$wowDir" || { echo "unzip failed."; exit 1; }

rm -rf "$wowDir/$latest" || { echo "rm failed."; exit 1; }

rm -rf "$wowDir/WTF"
rm -rf "$wowDir/Interface"

cp -r "$wowDir/$latestWithoutZip"/* "$wowDir" || { echo "cp failed."; exit 1; }

rm -rf "$wowDir/$latestWithoutZip" || { echo "rm failed."; exit 1; }