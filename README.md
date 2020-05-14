# transients
![Screenshot](/Screenshots/screenshot6.png)

# dependencies
### i3 config
To use the i3 dotfiles properly, you will need to have the following installed:
- Alacritty
- brightnessctl
- dmenu
- fish
- i3-gaps
- NetworkManager
- nm-applet
- pamixer
- picom
- PulseAudio
- wpgtk
- xbindkeys
- xfce4-screenshooter
- xss-lock

### .xinitrc
- udisks2
- udiskie
- wpgtk
- xorg-xrdb

### .bashrc
- wpgtk

### fonts
- Iosevka
- Material Icons
# installation
``.*rc`` files go in $HOME.

``xorg.conf.d`` goes to ``/etc/X11/``.

``tile-wallpaper.sh`` can be placed anywhere, but make sure that wpg is configured to not set a wallpaper and call ``tile-wallpaper.sh`` from the directory it's placed in.

Other files and folders go to ``~/.config/``.
