# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="gangleri"

CASE_SENSITIVE="false"

COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras node vundle battery battery2 markdown)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $ZSH/lib/aliases.zsh
source $ZSH/lib/key-bindings.zsh
source $ZSH/lib/git.zsh
source $ZSH/lib/completion.zsh
source $ZSH/lib/functions.zsh

bindkey -v # use vim key bindings

unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then

  export EDITOR='/usr/bin/vim'

elif [[ "$unamestr" == 'Darwin' ]]; then

  export EDITOR='/usr/local/bin/vim'

fi 

export NODE_HOME='/opt/node_current'
export NODE_PATH='/opt/node_current/lib/node_modules'
#:/usr/local/lib/jsctags
export MONGO_HOME='/opt/mongo_current'
export REDIS_HOME='/opt/redis_current'
export CASSANDRA_HOME='/opt/cassandra_current'

export PATH=$PATH:$NODE_HOME/bin:$MONGO_HOME/bin:$REDIS_HOME/bin:$CASSANDRA_HOME/bin

export PATH=/usr/local/bin:$PATH
export GIT_EDITOR=vim

if [[ "$unamestr" == 'Linux' ]]; then
  alias open="gnome-open"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias o="open . &"
alias lsh="ls -lh"
alias lisa="ls -lisah"
alias nukeDaMotherFucker="kill -9"

function popcmd {
history| awk '{a [$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

function cdc {
cd ~/code
}

function cls {
clear
ls
}

function psv {
open -a /Applications/Utilities/Activity\ Monitor.app
}

function kindleDir {
cd '/Users/alan/Library/Containers/com.amazon.Kindle/Data/Library/Application Support/Kindle/My Kindle Content'
}

function server {
local port="${1:-8000}"
open "http://localhost:${port}/"
python -m SimpleHTTPServer "$port"
}

function cwd2clip {
pwd|pbcopy
}

# Process management
alias tu="top -o cpu"
alias tm="top -o vsize"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [[ ! $TERM =~ screen ]]; then
  exec tmux
fi
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
