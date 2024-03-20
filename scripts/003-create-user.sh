#! /usr/bin/bash

echo "Changing root password: "
passwd
user1=""
while [ -z "$user1" ]
do
  echo "Choose a username"
  read user1
done
useradd -m -G wheel "$user1"
passwd $user1 
# echo "uncomment %Wheel ALL=(ALL) ALL"
# EDITOR=nvim visudo
echo '%wheel ALL=(ALL:ALL) ALL' | EDITOR='tee -a' visudo

