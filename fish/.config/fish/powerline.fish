if test (random 1 10) -gt 9
  echo 'updating powerline ...'
  go get -u github.com/justjanne/powerline-go &
end

function fish_prompt
  $GOPATH/bin/powerline-go -error $status -shell bare
end
