#!/bin/bash

# Function to rename files
rename_files() {
    local directory="$1"
    
    cd "$directory"
    
    for file in *.*.*; do
        if [[ -f "$file" ]]; then
            extension="${file##*.}"
            new_name=$(echo "$file" | sed 's/\./_/' | sed "s/\(\.[^.]*\)_\([^_]*\)$/\1.\2/")
            mv "$file" "$new_name"
        fi
    done
}

# Check if VIDEO_TS directory exists
if [[ -d "VIDEO_TS" ]]; then
    rename_files "VIDEO_TS"
    echo "Files in VIDEO_TS directory have been renamed successfully."
else
    echo "VIDEO_TS directory not found."
    exit 1
fi
