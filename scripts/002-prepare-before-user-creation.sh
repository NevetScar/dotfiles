#! /usr/bin/bash

systemctl enable NetworkManager
sed -i 's/HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block lvm2 filesystems fsck)/' /etc/mkinitcpio.conf
mkinitcpio -p linux
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
