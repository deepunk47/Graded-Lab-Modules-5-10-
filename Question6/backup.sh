#!/bin/bash

# Check for exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one filename."
    exit 1
fi

file="$1"

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Create backup filename
date_str=$(date +%Y-%m-%d)
backup_file="${file}_${date_str}.bak"

# Create backup
cp "$file" "$backup_file"

echo "Backup created successfully: $backup_file"
