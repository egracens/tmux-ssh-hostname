# tmux-ssh-hostname

Display SSH hostname in tmux status bar.

![screenshot](screenshot.png)

## Installation

Add to your `tmux.conf`:

```bash
set -g @plugin 'egracens/tmux-ssh-hostname'
```

Press `prefix + I` to install.

## Usage

Add `#{ssh_hostname}` to your status bar:

```bash
set -g status-right "#{ssh_hostname}"
```

The plugin exports `@ssh_hostname` variable. You can also reference it as `#{E:@ssh_hostname}` in other tmux options.

## Catppuccin Theme

Create a module file:

```bash
# ~/.config/tmux/modules/ssh_host.conf
%hidden MODULE_NAME="ssh_host"

set -gq "@catppuccin_${MODULE_NAME}_icon" "󰒋 "
set -gqF "@catppuccin_${MODULE_NAME}_color" "#{E:@thm_pink}"
set -gq "@catppuccin_${MODULE_NAME}_text" " #{E:@ssh_hostname}"

source -F "$HOME/.config/tmux/plugins/tmux/utils/status_module.conf"
```

Source it and add to status bar (conditional hides when not in SSH):

```bash
source -F "$HOME/.config/tmux/modules/ssh_host.conf"
set -g status-right "#{?#{m:ssh,#{pane_current_command}},#{E:@catppuccin_status_ssh_host},}"
```

## License

MIT
