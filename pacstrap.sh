#!/bin/bash
pacman -Syy --noconfirm curl git
git clone https://github.com/fish895623-org/archlinux-install.git /mnt/installer/
chmod +x /mnt/installer/*.sh

sed -i '/^\[options]$/a\ParallelDownloads=10' /etc/pacman.conf

pacstrap /mnt \
  base base-devel linux linux-firmware neovim networkmanager \
  git man-db man-pages texinfo dosfstools e2fsprogs mdadm \
  curl zsh
  
genfstab -U /mnt >> /mnt/etc/fstab
