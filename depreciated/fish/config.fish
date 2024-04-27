
if test -f /Users/nicosalm/anaconda3/bin/conda
    eval /Users/nicosalm/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end

if test -e ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

if test -e ~/Creative\ Cloud\ Files
    rm -rf ~/Creative\ Cloud\ Files
end
