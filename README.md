# exifdatefixer
A bash script for fixing photos/videos lacking the DateTimeOriginal EXIF tag.

This tool fixes the issue of photos/videos which do not have the DateTimeOriginal tag changing dates to the date of transfer when moved between machines or uploaded to cloud providers (e.g. OneDrive). With DateTimeOriginal, dates will not incorrectly change.

## Install
```
$ git clone https://github.com/therealMJT/exifdatefixer.git
$ cd exifdatefixer
```

## Usage
Basic Usage:
```
$ bash exifdatefixer.sh <directory>
```
Recursively scans all files in directory and its subdirectories for files lacking the DateTimeOriginal EXIF tag. The `FileModifyDate` tag is then used to set `DateTimeOriginal` (as well as `CreateDate` and `ModifyDate` for maximum compatibility).

Supports the following file types: `.jpg`, `.png`, `.mp4`, `.gif`, `.jpeg`, `.mov`, `.avi`, `.webp`, `.tiff`, `.mkv`, `.wmv`, `.bmp`, `.heic`, `.flv`, `.m4v`, `.svg`, `.3gp`, `.ico`, `.ts`, `.mts`, `.avif`, `.apng`

**Note:** It is assumed files have a `FileModifyDate` tag set. If no FileModifyDate tag is found, an `ISSUE` message will display and that file will be skipped.

## Requirements
* Linux / Bash
* [ExifTool](https://github.com/exiftool/exiftool)
