#!/bin/bash

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Both writefile and writestr must be specified"
    exit 1
fi 

echo "Writer parameters $1 and $2" 

# variables
writefile=$1
writestr=$2

# Extract the directory path from the full file path
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
mkdir -p "$writedir"

# Try to create/write to the file
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not create or write to the file $writefile"
    exit 1
fi

echo "File created successfully with content:"
echo "$writestr"
