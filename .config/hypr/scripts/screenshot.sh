#!/bin/bash

# This script captures a user-selected area of the screen, saves it with a timestamped filename,
# and copies the screenshot to the clipboard using wl-copy.

# Select area
area=$(slurp -d)
[ -z "$area" ] && exit 1  # Exit if selection was canceled

# Create screenshots directory if it doesn't exist
mkdir -p ~/Pictures/screenshots

# Format timestamp
timestamp=$(date +"%d%m%Y-%H%M")
filepath=~/Pictures/screenshots/"$timestamp".png

# Take screenshot, save to file and pipe to wl-copy
grim -g "$area" "$filepath" && wl-copy < "$filepath"