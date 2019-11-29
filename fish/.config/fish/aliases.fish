alias v 'nvim -o'

alias g git
alias gst 'git status'
alias gc 'git commit -v'
alias gco 'git checkout'
alias gca 'git commit -a'
alias gd 'git diff'
alias gdc 'git diff --cached'
alias gp 'git push'

alias bi 'bundler install -j256'
alias bu 'bundler update'

function gcob
  git checkout (git for-each-ref --sort=committerdate refs/heads --format='%(refname:short)' | tail -r | fzf --height=30% --reverse --no-mouse)
end

function gcostmp
  git branch -D stmona
  git fetch
  git checkout stmona
  git merge --no-ff -
  git push
end

function gmdd
  git branch --merged | grep -v develop | grep -v master | xargs git branch -d
end
