#!/usr/bin/env bash
# tmux-ssh-hostname - Display SSH hostname in tmux status bar

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Script call that outputs the hostname
script="#($PLUGIN_DIR/scripts/get_hostname.sh)"

# Export as tmux option - use #{E:@ssh_hostname} to reference it
tmux set -gq "@ssh_hostname" "$script"

# Also support #{ssh_hostname} placeholder in status-right/left
placeholder="#{ssh_hostname}"

status_right=$(tmux show-option -gqv status-right)
status_right="${status_right//$placeholder/$script}"
tmux set-option -gq status-right "$status_right"

status_left=$(tmux show-option -gqv status-left)
status_left="${status_left//$placeholder/$script}"
tmux set-option -gq status-left "$status_left"
