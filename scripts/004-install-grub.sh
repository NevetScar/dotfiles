#! /usr/bin/bash

parti=""
while [-z $parti]
do
  echo "Where is your efi partition: "
  read parti
done
mkdir /boot/EFI
mount $parti /boot/EFI
grub-install --target=x86_64-efi –bootloader-id=grub_uefi –recheck
grup-mkconfig -o /boot/grub/grub.cfg
echo "please exit, and umount -a and reboot"
