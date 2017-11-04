function dotfiles_gitInclude {
  filepath=".gitinclude"
  while IFS= read -r line
  do
    git add -f $line
  done < "$filepath"
}

function dotfiles_gitStage {
  dotfiles_gitInclude
  git add .
  echo "Staged changes:"
  git diff --name-only --cached | cat
}

function dotfiles_gitCommit {
  git commit -m "$(date +%Y.%m.%d_%H:%M:%S) from $(whoami)@$(hostname)"
}

function dotfiles {
  if [ "$1" = "-u" ] 
  then
    dotfiles_gitStage
    dotfiles_gitCommit
    git push
  elif [ "$1" = "-d" ] 
  then
    git pull --rebase
  else
    echo "\
Dotfiles synchronization tool.
Options:
  -u, --upload    upload configations to the cloud
  -d, --download  download configuration from the cloud
  -h, --help      print usage interface\
"
  fi 
}
