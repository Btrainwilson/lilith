#!/bin/bash

# Start a new tmux session in the background
tmux new-session -d -s brk

# In the first window, run the VPN connect script
tmux send-keys -t brk:1 'echo "3647,push" | .config/connect.sh purdue-vpn' C-m

# Create a second window
tmux new-window -t brk:2

# Sleep for some time to ensure VPN connection is established. Adjust as needed.
sleep 10

# In the second window, connect via SSH
tmux send-keys -t brk:2 'echo "3647,push" | ssh -X -Y -L 16006:127.0.0.1:6006 wilso692@brk1080lnx1.ecn.purdue.edu' C-m

# Attach to the tmux session
tmux attach -t brk

