#!/usr/bin/env zsh
stow fish
stow kitty
stow git
stow neovim
stow ruby

./brew.sh

m ntp set time.cloudflare.com
