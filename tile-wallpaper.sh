#!/bin/bash
if (( $(identify -format "%w" "$(< "${HOME}/.cache/wal/wal")") < 1920 )) && (( $(identify -format "%h" "$(< "${HOME}/.cache/wal/wal")") < 1080 ))
then
	feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
else
	feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
fi
