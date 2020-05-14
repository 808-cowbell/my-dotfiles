#!/bin/bash
# This script acts as a wallpaper setter for wpgtk that automatically tiles
# wallpapers under the resolution specified using the 'w' and 'h' variables.
# Change these variables to your liking.
#
# To use this script with wpgtk, you will need to prevent it from setting
# wallpapers and you will need to configure it to run a command after a
# theme is set. To achieve this using the wpgtk GUI:
# - In the "Options" tab, disable the "Set wallpaper" option.
# - Enable the "Run command after" option.
# - In the "Command" box, enter "bash /path/to/tile-wallpaper.sh".
#
# To restore wallpapers on startup, add tile-wallpaper.sh to the autostart
# of your window manager after initializing wpgtk. I achieve the latter by 
# using the "wp-init.sh" file in wpg's "~/.config" directory in my xinitrc.
# At the moment, I'm not sure of a better way to do this.

# Monitor width
w=1920

# Monitor height
h=1080

if (( $(identify -format "%w" "$(< "${HOME}/.cache/wal/wal")") < $w )) && (( $(identify -format "%h" "$(< "${HOME}/.cache/wal/wal")") < $h ))
then
	feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
else
	feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
fi
