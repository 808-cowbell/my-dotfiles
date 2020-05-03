# transients
![Screenshot 1](/Screenshots/wall1.png)
![Screenshot 2](/Screenshots/wall2.png)
This repo contains my personal configuration files to make PulseAudio sound better, disable mouse acceleration and properly set up my trackpad in X.Org, and make a dynamic i3 rice using wpgtk.

# dependencies
### i3 config
To use the i3 dotfiles properly, you will need to have the following installed:
- Alacritty
- brightnessctl
- dmenu
- fish
- i3-gaps (**not** i3wm)
- NetworkManager
- nm-applet
- pamixer
- picom
- PulseAudio
- wpgtk (make sure to install this properly and add ``wal -R`` to your .xinitrc so as to restore colors & wallpaper on X startup)
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

# "installation"
``xorg.conf.d`` goes to ``/etc/X11/``, all other folders go to ``~/.config/``.

``.*rc`` files go in $HOME.
