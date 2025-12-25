#!/usr/bin/env bash
# tmux-ssh-hostname - Display SSH hostname in tmux status bar
# Works with Catppuccin theme

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set plugin path for the module to use
tmux set -g @ssh_hostname_path "$CURRENT_DIR"

# Source the module
tmux source-file "$CURRENT_DIR/catppuccin_module.conf"
