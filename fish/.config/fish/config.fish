if test -n "$DEFAULT_PATH"
else
  set -gx DEFAULT_PATH $PATH
end

set -gx PATH $DEFAULT_PATH
set -gx PATH "/usr/local/sbin" $PATH

# locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'

# gpg
set -gx GPG_TTY (tty)

# go lang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# local bin
set -gx PATH "$HOME/.local/bin" $PATH

# editor
set -gx EDITOR nvim

# make jobs
set -gx MAKEFLAGS -j(/usr/local/bin/nproc)

# fish alias
source ~/.config/fish/aliases.fish

# fish prompt
source ~/.config/fish/powerline.fish

# gcloud
if test -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

# install fisher
# which -s fisher; or curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish; and fisher

# asdf
switch (uname)
  case Darwin
    source (/usr/local/bin/brew --prefix asdf)/asdf.fish
  case Linux
    source /opt/asdf-vm/asdf.fish
end
