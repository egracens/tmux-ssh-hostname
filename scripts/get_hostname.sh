#!/bin/bash
# Extracts SSH hostname from current pane

pane_pid=$(tmux display-message -p '#{pane_pid}')

# Find SSH process (direct or child of shell)
ssh_pid=$(pgrep -P "$pane_pid" ssh 2>/dev/null | head -1)
[ -z "$ssh_pid" ] && exit 0

# Get SSH command line
ssh_cmdline=$(cat /proc/"$ssh_pid"/cmdline 2>/dev/null | tr '\0' ' ')
[ -z "$ssh_cmdline" ] && exit 0

# Extract hostname (last arg, strip user@)
echo "$ssh_cmdline" | awk '{print $NF}' | sed 's/.*@//'
