#!/bin/bash
sed -i '/^\[options]$/a\ParallelDownloads=10' /etc/pacman.conf

pacstrap /mnt \
  base base-devel linux linux-firmware neovim networkmanager \
  git man-db man-pages texinfo dosfstools e2fsprogs mdadm \
  curl zsh
  
genfstab -U /mnt >> /mnt/etc/fstab
