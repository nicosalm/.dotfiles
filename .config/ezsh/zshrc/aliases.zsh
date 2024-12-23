# My config -- see ../ezshrc.zsh for other

# --- quick edits
alias ez='nvim ~/.config/ezsh/'
alias eg='nvim ~/.gitconfig'
alias ev='cd ~/.config/nvim/ && nvim .'
alias et='nvim ~/.tmux.conf'
alias lc='cd ~/dev/.leetcode && nvim .'
alias golings='cd ~/go/pkg/mod/github.com/mauricioabreu/golings@v0.8.0/exercises'
alias rmc='cd /Users/nicosalm/OneDrive\ -\ rogers-machinery.com/Shared\ Documents\ -\ Rogers\ Analytics/Dashboard\ Development'
alias python='python3'

# --- lazy 
alias j='jobs'
alias change-commits="!f() { VAR=$1; OLD=$2; NEW=$3; shift 3; git filter-branch --env-filter \"if [[ \\\"$`echo $VAR`\\\" = '$OLD' ]]; then export $VAR='$NEW'; fi\" \$@; }; f"
alias ut='uptime'
alias so='source'
alias nvim="$HOME/dev/nvim-macos-arm64/bin/nvim"
alias v='nvim'
alias c='clear'
alias ff='fastfetch'

alias r='radian'
alias wipetmp='setopt nonomatch; rm -rf /Users/nicosalm/tmp/{*,.*} 2>/dev/null; unsetopt nonomatch'

