export TERM="xterm-256color"

export ZSH=$HOME/.config/ezsh/oh-my-zsh

# `bat` replaces default man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

ZSH_THEME=nico

plugins=(
    zsh-completions
    zsh-syntax-highlighting
    history-substring-search
    tmux
    systemd
    web-search
    k
    extract
    z
    sudo
    git
    brew
    )

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Add to PATH to Install and run programs with "pip install --user"
export PATH=$PATH:~/.local/bin

export PATH=$PATH:~/.config/ezsh/bin

NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

[[ -s "$HOME/.config/ezsh/marker/marker.sh" ]] && source "$HOME/.config/ezsh/marker/marker.sh"

autoload -U compinit && compinit -C -d ~/.cache/zsh/.zcompdump        # zsh-completions
# autoload bashcompinit                 # bash completions
# bashcompinit

export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

# QuickZsh
SAVEHIST=50000      #save upto 50,000 lines in history. oh-my-zsh default is 10,000
#setopt hist_ignore_all_dups     # dont record duplicated entries in history during a single session

alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias e="exit"
alias ip="ip --color=auto"


# CUSTOM FUNCTIONS

# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}


# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }

speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

# Find dictionary definition
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}

# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}
