#!/bin/sh
$HOME/.config/wpg/wp_init.sh
$HOME/.config/wpg/tile-wallpaper.sh
xbindkeys -p
udiskie &
xss-lock ~/.config/i3/lock.sh &
exec bspwm
