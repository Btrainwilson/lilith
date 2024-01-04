# /bin/env/bash

# Find new wallpaper using passed dir

if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
fi

# Get random file from dir
wallpaper=$(find "$1" -type f | shuf -n 1)

# Set wallpaper
$wallpaper >> /tmp/eww_ch_wallpaper.log 

