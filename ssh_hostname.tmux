#!/usr/bin/env bash
# tmux-ssh-hostname - Display SSH hostname in tmux status bar
# Works with Catppuccin theme

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default settings
default_icon="󰒋 "
default_color="#{@thm_pink}"

# Get settings or use defaults
get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value
    option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

main() {
    local icon
    local color

    icon=$(get_tmux_option "@ssh_hostname_icon" "$default_icon")
    color=$(get_tmux_option "@ssh_hostname_color" "$default_color")

    # Set module variables for Catppuccin integration
    tmux set -gq "@catppuccin_ssh_host_icon" "$icon"
    tmux set -gqF "@catppuccin_ssh_host_color" "$color"
    tmux set -gq "@catppuccin_ssh_host_text" " #($CURRENT_DIR/scripts/ssh_host.sh)"

    # Source the Catppuccin module template if available
    if [ -f "$HOME/.config/tmux/plugins/tmux/utils/status_module.conf" ]; then
        tmux source -F "$HOME/.config/tmux/plugins/tmux/utils/status_module.conf"
    fi
}

main
