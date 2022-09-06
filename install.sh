ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo en_GB.UTF-8 >> /etc/locale.gen
locale-gen

echo LANG=en_GB.UTF-8 >> /etv/locale.conf

echo KEYMAP=uk >> /etc/vconsole.conf

echo arch >> /etc/hostname

echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   hostname.localdomain   hostname" >> /etc/hosts

passwd

useradd -m dragonfly1033

passwd dragonfly1033

usermod -aG wheel,audio,video,optical,storage dragonfly1033

EDITOR=nano visudo

mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager git

systemctl enable NetworkManager

exit
umount -l /mnt
reboot
