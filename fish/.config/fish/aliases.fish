function aalias
  abbr -a -g -- "$argv[1]" "$argv[2]"
end

aalias v 'nvim -o'

aalias g git
aalias gst 'git status'
aalias gc 'git commit -v'
aalias gco 'git checkout'
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
