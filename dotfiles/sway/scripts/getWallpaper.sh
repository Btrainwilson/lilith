WALLPAPER=$(find ~/3\ Resources/Pictures/wallpapers/ -type f | shuf -n1)
swaymsg output '*' bg "$WALLPAPER" fill
