#!/bin/bash

# Check if input file exists
if [ ! -f "words.txt" ]; then
    echo "Error: words.txt file not found."
    exit 1
fi

# Convert text to one word per line, sort, and count frequency
tr ' ' '\n' < words.txt | sort | uniq -c | sort -nr
