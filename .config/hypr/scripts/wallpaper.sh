#!/bin/bash

# This script changes the wallpaper to the next or previous image in the specified directory.
# Currently not used in the config but feel free to enable it.
# Requires hyprpaper, jq, and a directory of images at ~/Pictures/wallpaper/.

# Usage: ./wallpaper.sh <-n|-p|-r>
# -n: Next wallpaper
# -p: Previous wallpaper
# -r: Reload current wallpaper

# Check if a flag is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <-n|-p>"
    exit 1
fi

# Extract the flag
flag=$1

# Define the directory containing the images
image_dir=~/Pictures/wallpaper/

# Create an array to store image paths
image_paths=()

# Check if the directory exists
if [ -d "$image_dir" ]; then
    # Loop through each file in the directory
    for file in "$image_dir"*.{png,jpg}; do
        # Add the path to the array if it's a regular file
        if [ -f "$file" ]; then
            image_paths+=("$file")
        fi
    done
else
    echo "Directory $image_dir does not exist."
    exit 1
fi

# Read the current wallpaper index
wallpaper_index=$(cat ~/.cache/current_wallpaper)

# Check if the provided flag is valid
if [ "$flag" == "-n" ]; then
    # Increment the wallpaper index
    wallpaper_index=$(( (wallpaper_index + 1) % ${#image_paths[@]} ))
elif [ "$flag" == "-p" ]; then
    # Decrement the wallpaper index
    wallpaper_index=$(( (wallpaper_index - 1 + ${#image_paths[@]}) % ${#image_paths[@]} ))
elif [ "$flag" == "-r" ]; then
    # Skip
    hyprctl dispatch exec hyprpaper
    wallpaper_index=$(( (wallpaper_index) % ${#image_paths[@]} ))
else
    echo "Invalid flag."
    exit 1
fi

# Unload all wallpapers using hyprctl hyprpaper unload command
hyprctl hyprpaper unload all

# Preload the specified wallpaper using hyprctl hyprpaper preload command
hyprctl hyprpaper preload "${image_paths[$wallpaper_index]}"

# Fetch monitor names from the JSON output
monitor_names=($(hyprctl monitors -j | jq -r '.[] | .name'))

# Loop through each monitor and set the specified wallpaper
for monitor_name in "${monitor_names[@]}"; do
    # Set the specified wallpaper using hyprctl hyprpaper wallpaper command
    hyprctl hyprpaper wallpaper "$monitor_name,${image_paths[$wallpaper_index]}"
done

# Save the current wallpaper index
echo $wallpaper_index > ~/.cache/current_wallpaper

echo "Set wallpaper to ${wallpaper_index}"
