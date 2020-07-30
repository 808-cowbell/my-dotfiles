#!/bin/bash
#
# DO NOT USE THIS INSTALL SCRIPT! I haven't had a chance to test it yet.
# This is only a proof of concept at the moment.
#
## CONFIGURE THESE VARIABLES BEFORE RUNNING SCRIPT
# packages to be installed on system
PACKAGES+="alacritty base base-devel bspwm cowsay dhcpcd dialog efibootmgr "
PACKAGES+="file-roller firefox git grub gtk-engine-murrine lxappearance maim "
PACKAGES+="man-pages ntp pavucontrol rhythmbox sudo rofi thunar udiskie vim "
PACKAGES+="xdg-utils xorg-xinit xorg-xsetroot yay ytop-bin zsh "

# aur packages to be installed on system
AURPACKAGES+="pfetch polybar wpgtk-git yay ytop-bin "

# directory to desired timezone
TIMEZONE="/usr/share/zoneinfo/America/Denver"

# locales to be put in /etc/locale.gen
LOCALES=("en_US.UTF-8 UTF-8" "en_US ISO-8859-1")

# locale to be defined in /etc/locale.conf
LANG="en_US.UTF-8"

# drive to install grub on
GRUBDRIVE=""

# hostname of machine
HOSTNAME="sprout"

# password of root account
ROOTPASS="fart"

# name of user account
USERNAME="graham"

# password of user account
USERPASS="fart"

# permissions of user account (separated by comma)
USERPERMS="audio,optical,storage,video,wheel"

## GRAPHICS DRIVERS
# uncomment to install amd graphics drivers
#PACKAGES+="mesa vulkan-radeon xf86-video-amdgpu "

# uncomment to install intel graphics drivers
#PACKAGES+="mesa vulkan-intel xf86-video-intel "

# uncomment to install proprietary nvidia graphics drivers
#PACKAGES+="nvidia nvidia-settings "

## FUNCTIONS
set_timezone () {
    ln -sf $TIMEZONE /etc/localtime
    hwclock --systohc
}

setup_locale () {
    for val in $LOCALES; do
        echo $val >> /etc/locale.gen
    done
    locale-gen
    echo LANG=$LANG >> /etc/locale.conf
}

setup_hosts () {
    echo $HOSTNAME >> /etc/hostname
    echo "127.0.0.1	localhost"                         >> /etc/hosts
    echo "::1		localhost"                         >> /etc/hosts
    echo "127.0.0.1	$HOSTNAME.localdomain	$HOSTNAME" >> /etc/hosts
}

install_packages () {
    pacman -S reflector
    reflector --protocol https --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist
    pacman -S $PACKAGES
}

setup_accounts () {
    useradd -m $USERNAME
    usermod -aG $USERPERMS $USERNAME
    echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
    echo "Setting root password..." ; passwd
    echo "Setting user password..." ; passwd $USERNAME
}

install_grub () {
    grub-install $GRUBDRIVE
    grub-mkconfig -o /boot/grub/grub.cfg
}

install_aurpkgs () {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    rm -rf yay
    yay -S $AURPACKAGES
}

setup_dotfiles () {
    git clone https://github.com/808-cowbell/transients
    cp transients/.config ~
    mkdir -p ~/.config/wpg/templates
    cp transients/Shell\ Scripts/tile-wallpaper.sh ~/.config/wpg/templates
    cp transients/Profiles\ +\ RCs/.* ~
    echo "Sudo needed to copy files to /etc!"
    sudo mkdir -p /etc/X11/xorg.conf.d
    sudo cp transients/X\ Config/*.conf /etc/X11/xorg.conf.d
    echo "Not deleting transients directory, you may remove it yourself."
}

## INSTALLATION
#if [ $(id -u) = 0 ]; then
#    echo "Beginning first stage of install procedure!"
#    echo "Setting time..."            ; setup_timezone
#    echo "Setting up locales..."      ; setup_locale
#    echo "Setting hostname..."        ; setup_hosts
#    echo "Installing packages..."     ; install_packages
#    echo "Setting up accounts..."     ; setup_accounts
#    echo "Installing GRUB..."         ; install_grub
#    echo "The first stage of installation is complete!"
#    echo "Reboot, log in to your user account, then open the installer again."
#else
#    echo "Beginning second stage of install procedure!"
#    echo "Installing AUR packages..." ; install_aurpkgs
#    echo "Setting up dotfiles..."     ; setup_dotfiles
#    echo "System installation complete!"
#    echo "Configure wpgtk after starting bspwm."
#fi
