# locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# fzf
set -g FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# gpg
set -gx GPG_TTY (tty)

# go lang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# local bin
set -gx PATH "$HOME/.local/bin" $PATH

# editor
set -gx EDITOR nvim

# fish alias
source ~/.config/fish/aliases.fish

# fish prompt
source ~/.config/fish/powerline.fish

# install fisher
which -s fisher; or curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish; and fisher

# asdf
switch (uname)
  case Darwin
    source (brew --prefix asdf)/asdf.fish
end
