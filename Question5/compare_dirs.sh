#!/bin/bash

# Check for exactly two arguments
if [ "$#" -ne 2 ]; then
    echo "Error: Please provide exactly two directory names."
    exit 1
fi

dir1="$1"
dir2="$2"

# Check if both directories exist
if [ ! -d "$dir1" ] || [ ! -d "$dir2" ]; then
    echo "Error: One or both directories do not exist."
    exit 1
fi

# Create temporary files
ls "$dir1" | sort > dir1_files.txt
ls "$dir2" | sort > dir2_files.txt

echo "Common files:"
comm -12 dir1_files.txt dir2_files.txt

echo
echo "Files only in $dir1:"
comm -23 dir1_files.txt dir2_files.txt

echo
echo "Files only in $dir2:"
comm -13 dir1_files.txt dir2_files.txt

# Cleanup
rm dir1_files.txt dir2_files.txt
