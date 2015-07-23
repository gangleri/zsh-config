# Path to your oh-my-zsh installation.
export ZSH=/home/gangleri/.oh-my-zsh

ZSH_THEME="agnoster"
CASE_SENSITIVE="false" # Case insensitive completion
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd-mm-yyyy"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git autoenv colored-man cp zsh-syntax-highlighting)

# User configuration
export UPDATE_ZSH_DAYS=3
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export LANG=en_GB.UTF-8
export EDITOR="vim"
export GIT_EDITOR=$EDITOR
export NVM_DIR="/home/gangleri/.nvm"

bindkey -v

# hashes
hash -d code=$HOME/code
hash -d downloads=$HOME/Downloads

# opts
setopt autocd
setopt complete_aliases
setopt nocaseglob
setopt EXTENDED_GLOB
setopt numericglobsort

# alias
alias vi='vim'
alias vizsh='vim ~/.zshrc'
alias vivi='vim ~/.vimrc'
alias srczsh='source ~/.zshrc'
alias ..='cd ..'
alias zc='zcalc'
alias mb='udisksctl mount -b /dev/sdb1'
alias ub='udisksctl unmount -b /dev/sdb1'
alias kpo='ecryptfs-insert-wrapped-passphrase-into-keyring ~/.ecryptfs/wrapped-passphrase && mount -i /home/gangleri/keepass'
alias kpc='umount /home/gangleri/keepass'

# autoload
autoload zmv
autoload zcalc

# zstyle
zstyle ':completion:*' completer _expand _complete _correct
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && source $NVM_DIR/nvm.sh

