![Screenshot 1](/Screenshots/wall1.png)
![Screenshot 2](/Screenshots/wall2.png)
This repo contains my personal configuration files to make PulseAudio sound better, disable mouse acceleration and properly set up my trackpad in X.Org, and make a dynamic i3 rice using wpgtk.
# Dependencies
To use these dotfiles properly, you will need to have the following programs installed:
- brightnessctl
- dmenu
- i3-gaps (**not** i3wm)
- NetworkManager
- nm-applet
- pamixer
- picom
- PulseAudio
- wpgtk (make sure to install this properly and add ``wal -R`` to your .xinitrc so as to restore colors & wallpaper on X startup)
- xbindkeys
- xfce4-screenshooter

You will also need to install the following fonts, both of which can be found in Nerd Fonts:
- mononoki Nerd Font Mono
- InconsolataLGC Nerd Font Mono
# Where to move these folders
``xorg.conf.d`` ----------> ``/etc/X11/`` 

All others ----------> ``~/.config/``
