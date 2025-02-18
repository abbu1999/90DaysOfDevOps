#!/bin/bash

mkdir -p /opt/backup  # Creates the /opt/backup directory if it doesn't already exist

cd /opt/backup  # Changes the working directory to /opt/backup

tar -cvzf backup-$(date '+%d-%b-%Y-%H-%M-%S').tar.gz -P "$1"

<<info
 Creates a compressed tar archive of the directory provided as an argument ($1)
 The archive is named using the current date and time (format: DD-MMM-YYYY-HH-MM-SS)
 -c: Create an archive
 -v: Verbose mode (shows progress)
 -z: Compress with gzip
 -f: Specifies the filename
 -P: Preserves absolute paths
info

ls -ltrh backup-* | head -n+$(expr $(ls -ltrh | grep backup- | wc -l) - 3) | awk '{print $NF}' | xargs --no-run-if-empty rm  

<<info
 Lists all backup files sorted by modification time (oldest first)
 head -n+$(expr $(ls -ltrh | grep backup- | wc -l) - 3)  
 - Counts the number of backup files
 - Subtracts 3 from the total count to get the list of excess backups (if any)
 awk '{print $NF}' extracts only the filenames from the `ls` output
 xargs --no-run-if-empty rm removes the extra backup files (ensures at most 3 backups are kept)
info
