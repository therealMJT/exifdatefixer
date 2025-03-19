# exifdatefixer
A bash script for fixing photos/videos lacking the DateTimeOriginal EXIF tag.

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
Recursively scans all files in directory and its subdirectories for files lacking the DateTimeOriginal EXIF tag. The FileModifyDate tag is then used to set DateTimeOriginal. If no FileModifyDate tag is found, an `ISSUE` message will display and that file will be skipped.

Supports the following file types: `.jpg`, `.png`, `.mp4`, `.gif`, `.jpeg`, `.mov`, `.avi`, `.webp`, `.tiff`, `.mkv`, `.wmv`, `.bmp`, `.heic`, `.flv`, `.m4v`, `.svg`, `.3gp`, `.ico`, `.ts`, `.mts`, `.avif`, `.apng`

## Requirements
* Linux / Bash
* [ExifTool](https://github.com/exiftool/exiftool)
