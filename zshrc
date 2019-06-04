# zmodload zsh/zprof
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

ZSH_THEME="agnoster"
CASE_SENSITIVE="false" # Case insensitive completion
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# Register plugins included with oh-my-zsh
antigen bundle cargo
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle cp
antigen bundle dirhistory
antigen bundle django
antigen bundle docker
antigen bundle git
antigen bundle golang
antigen bundle history-substring-search
antigen bundle kubectl
antigen bundle npm
antigen bundle nvm
antigen bundle pep8
antigen bundle pip
antigen bundle pipenv
antigen bundle ssh-agent
antigen bundle sudo
antigen bundle vi-mode
antigen bundle vue
antigen bundle yarn
antigen bundle zsh-autosuggestions
antigen bundle zsh-syntax-highlighting
antigen bundle zsh_reload

# Register other zsh plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster
antigen apply

export HSTR_CONFIG=hicolor
export ANDROID_HOME=${HOME}/Library/Android/sdk
export BROWSER=chromium
export DEFAULT_USER=$USER
export EDITOR="nvim"
export GIT_EDITOR=$EDITOR
# export GOPATH=$(go env GOPATH)
export HH_CONFIG=hicolor        # get more colors
export HISTSIZE=999999999
export HISTFILE=~/.zsh_history  # ensure history file visibility
export SAVEHIST=$HISTSIZE
export LANG=en_GB.UTF-8
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:$HOME/go/bin:$HOME/.cargo/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${HOME}/flutter/bin
export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"
export UPDATE_ZSH_DAYS=3

hash -d code=$HOME/Code
hash -d downloads=$HOME/Downloads
hash -d go=$HOME/go/src
hash -d icloud=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs

setopt EXTENDED_GLOB
setopt NO_BEEP
setopt autocd
setopt complete_aliases
setopt nocaseglob
setopt numericglobsort
setopt hist_ignore_all_dups

alias ..='cd ..'
alias vi='nvim'
alias vim='mvim -v'
alias vimrc='$EDITOR ~/.vimrc'
alias zc='zcalc'
alias zshrc='$EDITOR ~/.zshrc'

alias gitc='git commit'
alias gitch='git checkout'
alias gitcl='git clone'
alias gitconfig='$EDITOR ~/code/git-config/gitconfig'
alias gitdiff='git difftool'
alias gits='git status'

alias pipo='pip list --outdated'
alias pipu='pip list --outdated | tail +3 | cut -d' ' -f 1 | xargs -n1 pip install -U'

alias pipo3='pip3 list --outdated'
alias ppu3='pip3 list --outdated | tail +3 | cut -d' ' -f 1 | xargs -n1 pip3 install -U'

alias nvml='nvm install $(nvm ls-remote | tail -n 1 | grep -oE "v.+")'

autoload zmv
autoload zcalc

zstyle ':completion:*' completer _expand _complete _correct
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

# [ -f "$HOME/.travis/travis.sh" ] && source $HOME/.travis/travis.sh
# [ -f "$HOME/.config/exercism/exercism_completion.zsh" ] && source ~/.config/exercism/exercism_completion.zsh

# placing the key bindings here allowed them to be picked up and applied correctly
# other plug-ins attempt to bing ^r so by having it here its the last and will be
# the one applied
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -s '^r' 'hh\n'

# zprof

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$HOME/.secrets" ] && . "$HOME/.secrets"
