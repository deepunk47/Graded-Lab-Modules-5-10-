#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Please provide one directory name."
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

mkdir -p "$dir/TextFiles" "$dir/Images" "$dir/Documents"

mv "$dir"/*.txt "$dir/TextFiles" 2>/dev/null
mv "$dir"/*.jpg "$dir"/*.png "$dir/Images" 2>/dev/null
mv "$dir"/*.pdf "$dir/Documents" 2>/dev/null

echo "Files organized successfully."
