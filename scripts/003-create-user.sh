#! /usr/bin/bash

echo "Changing root password: "
passwd
user1=""
while [ -z "$parti" ]
do
  echo "Choose a username"
  read user1
done
useradd -m -g users -G wheel "$user1"
passwd $user1 
echo "uncomment %Wheel ALL=(ALL) ALL"
EDITOR=nvim visudo

