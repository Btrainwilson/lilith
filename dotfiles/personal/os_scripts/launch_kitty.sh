#!/bin/bash

# Commands you want to execute on startup in Kitty terminal

commands_to_execute=(
    $1
)

# Combine commands with a newline separator
commands=$(printf "%s\n" "${commands_to_execute[@]}")

# Launch Kitty with the commands and keep it open
kitty -e fish -c "$commands; exec fish"

