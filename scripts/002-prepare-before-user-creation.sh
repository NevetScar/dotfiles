#! /usr/bin/bash

systemctl enable NetworkManager
sed -i '/HOOKS=/s/block filesystems/block lvm2 filesystems/' /etc/mkinitcpio.conf
mkinitcpio -p linux
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
