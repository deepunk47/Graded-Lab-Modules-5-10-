#!/bin/bash

# Validate argument count
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument is required."
    exit 1
fi

input="$1"

# Check if path exists
if [ ! -e "$input" ]; then
    echo "Error: The given path does not exist."
    exit 1
fi

# If input is a file
if [ -f "$input" ]; then
    echo "Input is a file."
    echo "Lines Words Characters FileName"
    wc "$input"

# If input is a directory
elif [ -d "$input" ]; then
    echo "Input is a directory."
    total_files=$(find "$input" -type f | wc -l)
    txt_files=$(find "$input" -type f -name "*.txt" | wc -l)

    echo "Total number of files: $total_files"
    echo "Number of .txt files: $txt_files"

else
    echo "Error: Unsupported file type."
fi

