# Quick edits
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'
alias eg 'nvim ~/.gitconfig'
alias ev 'nvim ~/.config/nvim/'
alias et 'nvim ~/.tmux.conf'

alias vim-norc 'vim -u NORC'
alias vim-none 'vim -u NONE'
alias nvim-norc 'nvim -u NORC'
alias nvim-none 'nvim -u NONE'

function timestamp
    python -c 'import time; print(int(time.time()))'
end

alias j jobs
alias ut 'uptime'
alias so 'source'
alias t 'todo.sh'
alias l 'eza --group-directories-first'
alias ls 'l'
alias la 'l -a'
alias ll 'l --git -l'
alias lt 'l --tree -D -L 2 -I cache|log|logs|node_modules|vendor'
alias ltt 'l --tree -D -L 3 -I cache|log|logs|node_modules|vendor'

alias ccat 'pygmentize -g'

alias g 'git'
alias c 'clear'
alias v 'nvim'
alias vim 'nvim'

# Git aliases
alias gs 'git status -s'
