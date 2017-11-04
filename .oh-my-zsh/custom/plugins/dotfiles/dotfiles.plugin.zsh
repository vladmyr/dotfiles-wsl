function dotfiles_gitInclude {
  filepath=".gitinclude"
  while IFS= read -r line
  do
    git add -f $line
  done < "$filepath"
}

function dotfiles_hasStagedFiles {
  diffList=$(git diff --name-only --cached | cat)
  [ ! -z ${diffList// } ] && return
  false
}

function dotfiles_gitStage {
  dotfiles_gitInclude
  if dotfiles_hasStagedFiles; 
  then 
    cGreen='\033[0;32m'
    cNone='\033[0m'
    echo -e "Staged changes:\n${cGreen}$(git diff --name-only --cached | cat)${cNone}"
  fi
}

function dotfiles_gitCommit {
  if dotfiles_hasStagedFiles;
  then
    git commit -m "$(date +%Y.%m.%d_%H:%M:%S) from $(whoami)@$(hostname)"
  fi
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
