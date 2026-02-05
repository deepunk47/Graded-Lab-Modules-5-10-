#!/bin/bash

# Check if input file exists
if [ ! -f "emails.txt" ]; then
    echo "Error: emails.txt file not found."
    exit 1
fi

# Extract valid email addresses
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid_temp.txt

# Remove duplicates and store in valid.txt
sort valid_temp.txt | uniq > valid.txt

# Extract invalid email addresses
grep -v -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

# Clean up temporary file
rm valid_temp.txt

echo "Email cleaning completed."
echo "Valid emails stored in valid.txt"
echo "Invalid emails stored in invalid.txt"
