#!/bin/bash
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf


ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

useradd -m -g users -G wheel -s /bin/bash dan99

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman -Syyu --noconfirm grub efibootmgr os-prober
grub-install --efi-directory=/boot/efi
sed -i "s/GRUB_TIMEOUT=[[:digit:]]/GRUB_TIMEOUT=1/g" /etc/default/grub
grep 'GRUB_DISABLE_OS_PROBER' /etc/default/grub || echo 'GRUB_DISABLE_OS_PROBER=false' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

su - dan99 <<EOF
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -sri --noconfirm
	rm -rf ~/yay
EOF

systemctl enable NetworkManager.service
systemctl enable sshd.service
