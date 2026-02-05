#!/bin/bash

# Validate argument count
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one log file as argument."
    exit 1
fi

logfile="$1"

# Validate file existence and readability
if [ ! -f "$logfile" ] || [ ! -r "$logfile" ]; then
    echo "Error: Log file does not exist or is not readable."
    exit 1
fi

# Count total entries
total_entries=$(wc -l < "$logfile")

# Count log levels
info_count=$(grep -c " INFO " "$logfile")
warning_count=$(grep -c " WARNING " "$logfile")
error_count=$(grep -c " ERROR " "$logfile")

# Get most recent ERROR
recent_error=$(grep " ERROR " "$logfile" | tail -n 1)

# Generate report file
date_str=$(date +%Y-%m-%d)
report_file="logsummary_${date_str}.txt"

{
    echo "Log Summary Report"
    echo "Date: $date_str"
    echo "----------------------"
    echo "Total log entries: $total_entries"
    echo "INFO messages: $info_count"
    echo "WARNING messages: $warning_count"
    echo "ERROR messages: $error_count"
    echo "Most recent ERROR:"
    echo "$recent_error"
} > "$report_file"

# Display results
echo "Total log entries: $total_entries"
echo "INFO messages: $info_count"
echo "WARNING messages: $warning_count"
echo "ERROR messages: $error_count"
echo "Most recent ERROR:"
echo "$recent_error"
echo "Report generated: $report_file"
