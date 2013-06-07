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
  export NODE_HOME=/opt/node_current
  export NODE_PATH='/opt/node_current/lib/node_modules':/usr/local/lib/jsctags
  export MONGO_HOME='/opt/mongo_current'
  export REDIS_HOME='/opt/redis_current'

  export PATH=$PATH:$NODE_HOME/bin:$MONGO_HOME/bin:$REDIS_HOME/src

elif [[ "$unamestr" == 'Darwin' ]]; then

  export EDITOR='/usr/local/bin/vim'
  export NODE_PATH=/usr/local/lib/node_modules/
  export PATH=$PATH:/usr/local/share/npm/bin

fi 

export PATH=/usr/local/bin:$PATH
export CONFIGBK=~/Dropbox/config
export GIT_EDITOR=vim

if [[ "$unamestr" == 'Linux' ]]; then
  alias open="gnome-open"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

alias o="open . &"
alias lsh="ls -lh"

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

# Process management
alias tu="top -o cpu"
alias tm="top -o vsize"

