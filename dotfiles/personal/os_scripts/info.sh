#!/bin/bash
#

# Commands you want to execute on startup in Kitty terminal
commands_to_execute=(
    "tmuxifier s info"
    "neofetch"
    "gcalcli agenda"
    "todo.sh lf daily.txt"
)


# Combine commands with a newline separator
commands=$(printf "%s\n" "${commands_to_execute[@]}")

# Launch Kitty with the commands and keep it open
kitty -e fish -c "$commands; exec fish"
