#!/bin/bash

echo 0 > ./temp_file_for_exifdatefixer.txt

function fix_single() {
	local date_time_original=$(exiftool -DateTimeOriginal -s3 -m $0)
	if [ "$date_time_original" = "" ]; then
		local file_modify_date=$(exiftool -FileModifyDate -s3 -m $0)
		if [ "$file_modify_date" ]; then
			exiftool -AllDates="$file_modify_date" -overwrite_original -q -m $0
			local curr_count=$(cat ./temp_file_for_exifdatefixer.txt)
			echo $((curr_count+1)) > ./temp_file_for_exifdatefixer.txt
		else
			echo "ISSUE: $0 - no FileModifyDate tag found."
		fi
	fi
}

export -f fix_single
find "$1" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.heic" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.svg" -o -iname "*.avif" -o -iname "*.apng" -o -iname "*.bmp" -o -iname "*.ico" -o -iname "*.tiff" -o -iname "*.mp4" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.wmv" -o -iname "*.flv" -o -iname "*.m4v" -o -iname "*.3gp" -o -iname "*.mts" -o -iname "*.ts" \) -exec bash -c 'fix_single' {} \;

count=$(cat ./temp_file_for_exifdatefixer.txt)
echo "Successfully fixed $count files."

rm -f ./temp_file_for_exifdatefixer.txt # clean up
