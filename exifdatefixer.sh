#!/bin/bash

exiftool -r "-AllDates<FileModifyDate" -if "not \$DateTimeOriginal" -overwrite_original -preserve -m "$1"
