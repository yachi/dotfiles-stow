#!/usr/bin/env fish

cd (mktemp -d)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S asdf-vm --noconfirm
