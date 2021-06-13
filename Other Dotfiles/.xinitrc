#!/bin/sh
/usr/libexec/gsd-xsettings &
./.fehbg
wal -Rt
dunst &
udiskie &
picom &
exec dbus-launch --exit-with-x11 bspwm
