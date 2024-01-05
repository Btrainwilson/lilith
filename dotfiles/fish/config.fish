
# Created by `pipx` on 2023-07-22 19:11:42
set PATH $PATH /home/kasner/.local/bin
set RANGER_LOAD_DEFAULT_RC FALSE
set -gx EDITOR /usr/bin/nvim

set -gx OPENSSL_CONF /home/kasner/.config/openssl.cnf

#Set API keys
source ~/.config/api_keys.fish
set PATH $PATH /home/kasner/.tmux/plugins/tmuxifier/bin 
function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && \
    echo "opening $file" && \
    open "$file"
end
#eval (tmuxifier init - fish)
#
if test -z $DISPLAY; and test (tty) = "/dev/tty1"
    sway
end
