#!/usr/bin/env fish

# install vim plug
test -f ~/.local/share/nvim/site/autoload/plug.vim; or curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugUpdate +PlugUpgrade +qall
