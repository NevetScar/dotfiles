#! /usr/bin/bash

systemctl start bluetooth
systemctl enable bluetooth


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

yay -Syu cups gutenprint foomatic-db-gutenprint-ppds zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k ttf-meslo-nerd-font-powerlevel10k --noconfirm 
chsh -s /usr/bin/zsh
cd ~/dotfiles
stow git
stow nvim-lazy
stow zsh
systemctl enable cups
systemctl start cups
echo "You must reboot to get printer drivers to work"

