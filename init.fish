#!/usr/bin/env fish

# install asdf python
asdf plugin-add python
set python_version (asdf list-all python | rg '^\d\.\d\.\d$' | tail -n 1)
asdf install python $python_version
asdf global python $python_version
pip install neovim

# install asdf nodejs
asdf plugin-add nodejs
set nodejs_version (asdf list-all nodejs | tail -n 1)
asdf install nodejs $nodejs_version
asdf global nodejs $nodejs_version
sudo pacman -S --noconfirm yarn

# install vim plug
test -f ~/.local/share/nvim/site/autoload/plug.vim; or curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugUpdate +PlugUpgrade +qall
