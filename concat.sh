#!/bin/bash

# Prompt the user for input files
read -p "Enter the first file name: " file1
read -p "Enter the second file name: " file2
read -p "Enter the output file name: " output_file

# Check if input files exist
if [[ ! -f "$file1" ]]; then
  echo "Error: $file1 does not exist."
  exit 1
fi

if [[ ! -f "$file2" ]]; then
  echo "Error: $file2 does not exist."
  exit 1
fi

# Concatenate the files and save the result to output_file
cat "$file1" "$file2" > "$output_file"

echo "Files concatenated into $output_file"
