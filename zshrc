# Path to your oh-my-zsh installation.
export ZSH=/home/gangleri/.oh-my-zsh

export TERM="xterm-256color"

ZSH_THEME="agnoster"
CASE_SENSITIVE="false" # Case insensitive completion
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd-mm-yyyy"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git ssh-agent colored-man cp zsh-syntax-highlighting)

# User configuration
export UPDATE_ZSH_DAYS=3
export PATH="/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/android-studio/bin
export LANG=en_GB.UTF-8
export EDITOR="vim"
export GIT_EDITOR=$EDITOR
export NVM_DIR="/home/gangleri/.nvm"
export BROWSER=chromium
export DEFAULT_USER=$USER
mypath=$(dirname $0:A)

bindkey -v

# hashes
hash -d code=$HOME/code
hash -d nodeschool=$HOME/code/nodeschool
hash -d containers=$HOME/containers
hash -d downloads=$HOME/Downloads
hash -d vimplugs=$HOME/code/vim/plugins
hash -d config=$HOME/.config
hash -d videos=$HOME/Videos

# opts
setopt autocd
setopt complete_aliases
setopt nocaseglob
setopt EXTENDED_GLOB
setopt numericglobsort
setopt NO_BEEP

# alias
alias zc='zcalc'

alias vi='vim'
alias viess='vim ~/.essential.vim'
alias videmo='vim -u ~/.essential.vim ~/.vimrc'
alias vimrc='vim ~/.vimrc'

alias zshrc='$EDITOR ~/.zshrc'
alias srczshrc='source ~/.zshrc'

alias i3config='$EDITOR ~/.config/i3/config'
alias i3statusconfig='$EDITOR ~/.config/i3status/config'
alias i3reload='i3-msg reload'

alias ..='cd ..'
alias mb='udisksctl mount -b /dev/sdb1'
alias ub='udisksctl unmount -b /dev/sdb1'

alias kpo='ecryptfs-insert-wrapped-passphrase-into-keyring ~/.ecryptfs/wrapped-passphrase && mount -i /home/gangleri/keepass'
alias kpc='umount /home/gangleri/keepass'

alias gitconfig='$EDITOR ~/code/git-config/gitconfig'
alias gitdiff='git difftool'
alias gits='git status'
alias gitc='git commit'
alias gitcl='git clone'
alias gitch='git checkout'

alias rkhunt='sudo rkhunter --check'
alias rkpropupd='sudo rkhunter --propupd'

# autoload
autoload zmv
autoload zcalc

# zstyle
zstyle ':completion:*' completer _expand _complete _correct
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

# functions

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && source $NVM_DIR/nvm.sh


[[ -s "/home/gangleri/.gvm/scripts/gvm" ]] && source "/home/gangleri/.gvm/scripts/gvm"
