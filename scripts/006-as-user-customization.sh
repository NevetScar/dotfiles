#! /usr/bin/bash

echo "deleting dotfiles for root"
sudo rm -rf /root/dotfiles
echo "Staring and enabling bluetooth"
systemctl is-enabled bluetooth || systemctl enable bluetooth
systemctl is-active bluetooth || systemctl start bluetooth


echo "Install yay"
if [[ -f '/usr/bin/yay' ]]; then
    echo "Congratulations, yay is installed!"
else
    cd ~
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -sicr --noconfirm
    rm -rf ~/yay
fi

yay -Syu cups gutenprint foomatic-db-gutenprint-ppds zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions starship ttf-firecode-nerd --noconfirm 
chsh -s /usr/bin/zsh
cd ~/dotfiles
stow git
stow nvim-lazy
stow zsh
echo "starting and enabling cups"
systemctl is-enabled cups || systemctl enable cups
systemctl is-active cups || systemctl start cups
echo "You must reboot to get printer drivers to work"

