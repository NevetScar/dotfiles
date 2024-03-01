#! /usr/bin/bash

if [[ -f '/usr/bin/yay' ]]; then
    echo "Congratulations, yay is installed!"
else
    cd ~
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi