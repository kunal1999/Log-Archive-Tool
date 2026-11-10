#!/bin/bash

###########################################################
# take a log directory path as inline  args
# archive the logs in the directory to a tar file
# and move the tar file to the archive directory
###########################################################

## check if the log directory path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Error: No log directory path provided."
    echo "Usage: $0 <log_directory_path>"
    exit 1
fi

log_dir="$1"

## check if the log directory exists
if [ ! -d "$log_dir" ]; then
    echo "Error: Log directory '$log_dir' does not exist."
    exit 1
fi

## create an archive directory if it doesn't exist
date=$(date +%Y%m%d_%H%M%S)
archive_dir=log_archive_$date
if [ ! -d "$archive_dir" ]; then
    mkdir -p "$archive_dir"
fi
mv "$log_dir"/* "$archive_dir"/
### create a tar file of the archive directory
tar -czf "$archive_dir.tar.gz" "$archive_dir"
##delete the archive directory after creating the tar file
rm -rf "$archive_dir"
