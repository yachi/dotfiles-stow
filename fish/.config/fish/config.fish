# gpg
set -gx GPG_TTY (tty)

# go lang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# editor
set -gx EDITOR nvim

# fish alias
source ~/.config/fish/aliases.fish

# fish prompt
source ~/.config/fish/powerline.fish

# asdf
switch (uname)
  case Darwin
    source (brew --prefix asdf)/asdf.fish
end
