[ -z "$PS1" ] && return

set -o vi
bind -m vi-insert "\C-l":clear-screen

bind TAB:menu-complete
export PYTHONSTARTUP="$(dirname `readlink ~/.bashrc`)/.pythonrc"

export DISPLAY=:0

# Git autocomplete
source ~/.git-completion.sh

if [ -e "$HOME/.bashrc.local" ]; then
    source $HOME/.bashrc.local
fi

# Python virtualenvwrapper
if [[ -e "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    # Default to python3 if avaliable
    if [ -e "/usr/bin/python3" ]; then
        export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
    fi
    export WORKON_HOME=$HOME/.virtualenvs/
    export PROJECT_HOME=$HOME/Devel/
    source /usr/local/bin/virtualenvwrapper.sh
fi

# rbenv
if [[ -d "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# direnv
if command -v direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

# Common things
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
