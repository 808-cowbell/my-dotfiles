#!/bin/bash
# This script acts as a wallpaper setter for wpgtk that automatically tiles
# wallpapers with a resolution lower than the active display.
#
# To use this script with wpgtk, you will need to prevent it from setting
# wallpapers and you will need to configure it to run a command after a
# theme is set. To achieve this using the wpgtk GUI:
# - In the "Options" tab, disable the "Set wallpaper" option.
# - Enable the "Run command after" option.
# - In the "Command" box, enter "bash /path/to/tile-wallpaper.sh".
#
# To restore wallpapers on startup, add tile-wallpaper.sh to the autostart
# of your window manager after initializing wpgtk.

# Monitor width
w=$(xrandr | fgrep '*' | awk '{print $1}' | sed -e 's/x/ /g' | cut -f1 -d' ')

# Monitor height
h=$(xrandr | fgrep '*' | awk '{print $1}' | sed -e 's/x/ /g' | cut -f2 -d' ')

# Compares width and height of cached wallpaper to monitor resolution
if (( $(identify -format "%w" "$(< "${HOME}/.cache/wal/wal")") < $w )) && (( $(identify -format "%h" "$(< "${HOME}/.cache/wal/wal")") < $h ))
then
    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
else
    feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
fi
