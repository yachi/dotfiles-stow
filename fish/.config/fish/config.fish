if test -n "$DEFAULT_PATH"
else
  set -gx DEFAULT_PATH $PATH
end

# set XDG_CURRENT_DESKTOP sway

set -gx PATH $DEFAULT_PATH
set -gx PATH "/usr/local/sbin" $PATH

# locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'

# gpg
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# go lang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# local bin
set -gx PATH "$HOME/.local/bin" $PATH

# editor
set -gx EDITOR nvim

# make jobs
switch (uname)
  case Darwin
    set -gx MAKEFLAGS -j(/usr/local/bin/nproc)
  case Linux
    set -gx MAKEFLAGS -j(/usr/bin/nproc)
end

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
