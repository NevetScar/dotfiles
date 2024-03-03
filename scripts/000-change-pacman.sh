#! /usr/bin/bash
sed -i \
    -e 's/#Color/Color/g' /etc/pacman.conf \
    -e 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' \
    -e 's/#\[multilib\]/\[multilib\]/g' \
    -e '/\[multilib\]/,/Include/{s/#//}' \
    ./pacman.conf 
