#!/usr/bin/env bash
TEMP=$(find * -type d | fzf) 
cd "$TEMP"; 
echo $TEMP;
ranger;
