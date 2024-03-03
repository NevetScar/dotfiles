#! /usr/bin/bash

echo "Setting swap file"
cd /root
dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
chmod 600 /swapfile
mkswap /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 00' | tee -a /etc/fstab
free -m
mount -a
swapon -a

echo "Setting timezone"
timedatectl set-timezone America/Guatemala
systemctl enable systemd-timesyncd

echo "Setting hostname"
hostname=""
while [ -z $hostname ]
do
  echo "Choose a hostname"
  read hostname
done
hostnamectl set-hostname $hostname 
echo -e "127.0.0.1 localhost\n127.0.1.1 $hostname" >> /etc/hosts
hostnamectl
