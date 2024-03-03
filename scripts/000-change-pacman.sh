#! /usr/bin/bash
sed -i \
    -e 's/#Color/Color/g' \
    -e 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' \
    -e 's/#\[multilib\]/\[multilib\]/g' \
    -e '/\[multilib\]/,/Include/{s/#//}' \
    /etc/pacman.conf 
