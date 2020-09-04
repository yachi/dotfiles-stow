function aalias
  abbr -a -g -- "$argv[1]" "$argv[2]"
end

aalias v 'nvim -o'
aalias nf "nvim -o (fzf)"

aalias g git
aalias gst 'git status'
aalias gc 'gitmoji -c'
aalias gco 'git checkout'
aalias gcobb 'git checkout -b'
aalias gca 'git commit -a'
aalias gd 'git diff'
aalias gdc 'git diff --cached'
aalias gp 'git push'
aalias gup 'git pull --rebase'
aalias gfg 'git ls-files|grep'
aalias gwip 'git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
aalias gunwip 'git log -n 1 | grep -q -c wip; and git reset HEAD~1'

aalias bi 'bundler install -j256'
aalias bu 'bundler update'

aalias dc 'docker-compose'

aalias rg "rg --hidden --glob='!.git/*'"

aalias rrr 'bin/rails routes | rg'

function gcob
  git checkout (gbl)
end

function gbl
  git for-each-ref --sort=committerdate refs/heads --format='%(refname:short)' | tail -r | fzf --height=30% --reverse --no-mouse
end

function vdc
  nvim -o (git diff --cached --name-only | fzf)
end

function gcost
  git branch -D stmona
  git branch -D staging
  git branch -D sandbox
  git fetch
  git checkout stmona; or git checkout staging; or git checkout sandbox
end

function gcostmp
  gcost
  git merge --no-ff -
  git push
end

function gmdd
  git branch --merged | grep -v develop | grep -v master | xargs git branch -d
end

function rslf
  git ls-files | grep -E "^spec/.*($argv[1]).*_spec\.rb\$"
  env RAILS_ENV=test bin/rspec (git ls-files | grep -E "^spec/.*($argv[1]).*_spec\.rb\$")
end

function gfpp
  begin
    set -lx OVERCOMMIT_DISABLE 1
    for a in {master,develop}
      git checkout $a; and git push
    end; and git push --tags
  end
end

function gccl
  git add changelog/unreleased/
  git commit -va -m '📝  add changelog item'
end

function pie
  sed -i '' "s#$argv[1]#$argv[2]#g" (git grep --name-only $argv[1])
end

function rsdm
  set merge_base (git merge-base head $argv[1])
  set files (git diff $merge_base --name-only (git ls-files 'spec*spec.rb'))
  echo $files
  bin/rspec $files
end

function prdm
  set merge_base (git merge-base head $argv[1])
  git diff $merge_base --name-only '*.rb' '*.js'
  git diff $merge_base --name-only '*.rb' '*.js' | parallel -m yarn prettier --write {}
end
