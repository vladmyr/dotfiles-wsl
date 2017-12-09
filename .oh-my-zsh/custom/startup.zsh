# shortcuts
alias c="clear"
alias startSSHAgent="eval '$(ssh-agent -s)'"
alias addSSHKeyGithub="ssh-add ~/.ssh/id_rsa"
alias addSSHKeyGitlab="ssh-add ~/.ssh/vladmyr_i5_win10wsl_gitlab_id_rsa"
alias addSSHKeyAzureFree="ssh-add ~/.ssh/vladmyr_i5_win10wsl_azure_free_tier_id_rsa"
alias ash="startSSHAgent && addSSHKeyGithub && addSSHKeyGitlab"
alias es="vi ~/.oh-my-zsh/custom/startup.zsh"

# navigation aliases
alias ltta="cd /mnt/c/dev/js/learnittwice-api/"
alias dev="cd /mnt/c/dev/"
