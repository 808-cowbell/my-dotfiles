#!/bin/sh
$HOME/.config/wpg/wp_init.sh
$HOME/.config/wpg/tile-wallpaper.sh
picom -b
udiskie &
polybar wpgtk &
xss-lock ~/.config/i3/lock.sh &
exec sowm
