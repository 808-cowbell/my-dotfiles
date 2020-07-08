#!/bin/sh
# This script provides a locking mechanism for laptops. Call it from
# anywhere you prefer, e.g. .xinitrc or .bspwmrc.

set -e
xset s off dpms 0 10 0
i3lock --color=$(sed 's/#//; 1q' .cache/wal/colors) --ignore-empty-password --show-failed-attempts --nofork
xset s off dpms 600 600 600
