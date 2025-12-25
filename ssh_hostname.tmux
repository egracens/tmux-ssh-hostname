#!/usr/bin/env bash
# tmux-ssh-hostname - Display SSH hostname in tmux status bar

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Placeholder → script mapping
placeholder="#{ssh_hostname}"
script="#($PLUGIN_DIR/scripts/get_hostname.sh)"

# Interpolate status-right
status_right=$(tmux show-option -gqv status-right)
status_right="${status_right//$placeholder/$script}"
tmux set-option -gq status-right "$status_right"

# Interpolate status-left
status_left=$(tmux show-option -gqv status-left)
status_left="${status_left//$placeholder/$script}"
tmux set-option -gq status-left "$status_left"
