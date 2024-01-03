# ~/.config/fish/conf.d/abbr.fish
# Core programs
abbr -a n 'nvim'
abbr -a N 'nvim .'
abbr -a n.c 'nvim ~/.config/nvim/'
abbr -a t 'tmux'
abbr -a th 'thunar'
abbr -a g 'git'
abbr -a c 'clear'
abbr -a e 'exit'


abbr -a -- - 'cd -'
abbr -a la 'ls -la'
abbr -a ldot 'ls -ld .*'
abbr -a ll 'ls -lGFh'
abbr -a lsa 'ls -aGF'
abbr -a tarls 'tar -tvf'
abbr -a untar 'tar -xv'
abbr -a zz exit

# git
abbr -a gia 'git add'
abbr -a gib 'git rev-parse --abbrev-ref HEAD'
abbr -a gic 'git clean'
abbr -a gih 'git checkout'
abbr -a gwhoami 'echo "user.name:" (git config user.name) && echo "user.email:" (git config user.email)'

# gcalcli 
abbr -a gca 'gcalcli'

# note taking
abbr -a td 'todo.sh'
abbr -a tda 'todo.sh add'
abbr -a tdl 'todo.sh list'
abbr -a tdp 'todo.sh pri'
abbr -a tds 'todo.sh start'
abbr -a tdd 'todo.sh do'

# ... etc...

function abbr-erase-all --description 'Erase all your abbrs'
    while true
        read -l -P "This will erase all your abbreviations. You sure? [y/N] " confirm
        switch $confirm
            case Y y
                break
            case '' N n
                return 1
        end
    end
    for abbr_name in (abbr -l)
        abbr -e $abbr_name
    end
    set -q MY_ABBR_SET && set -e MY_ABBR_SET
end
