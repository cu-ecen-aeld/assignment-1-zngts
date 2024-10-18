#!/bin/bash

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Both filesdir and searchstr not speficied"
    exit 1
fi

# Check if filesdir is a valid directory
if [ ! -d $1 ]; then
    echo "Error: filesdir $$1 is not a valid directory"
    exit 1
fi

echo "Finder parameters are $1 $2 "
echo

# variables
filesdir=$1
searchstr=$2

# Find all files in the directory and count them
file_count=$(find "$filesdir" -type f | wc -l)

# Search for the string in the files and count the matching lines
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Output the results
echo "The number of files are $file_count and the number of matching lines are $match_count"
