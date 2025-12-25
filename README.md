# tmux-ssh-hostname

Display the remote SSH hostname in your tmux status bar. Only appears when the current pane is running an SSH session.

## Features

- Shows remote hostname only when connected via SSH
- Automatically hides when not in SSH session
- Catppuccin theme integration
- Customizable icon and color

## Requirements

- tmux 3.0+
- [Catppuccin tmux theme](https://github.com/catppuccin/tmux) (optional, for styled output)

## Installation

### With TPM (recommended)

Add to your `tmux.conf`:

```bash
set -g @plugin 'egracens/tmux-ssh-hostname'
```

Then press `prefix + I` to install.

### Manual

Clone the repo:

```bash
git clone https://github.com/egracens/tmux-ssh-hostname ~/.config/tmux/plugins/tmux-ssh-hostname
```

Add to your `tmux.conf`:

```bash
run '~/.config/tmux/plugins/tmux-ssh-hostname/ssh_hostname.tmux'
```

## Usage

Add to your status bar with conditional rendering:

```bash
set -g status-right "#{?#{m:ssh,#{pane_current_command}},#{E:@catppuccin_status_ssh_host},}"
```

Or create a module file for Catppuccin:

```bash
# ~/.config/tmux/modules/ssh_host.conf
%hidden MODULE_NAME="ssh_host"

set -ogq "@catppuccin_${MODULE_NAME}_icon" "󰒋 "
set -ogqF "@catppuccin_${MODULE_NAME}_color" "#{E:@thm_pink}"
set -ogq "@catppuccin_${MODULE_NAME}_text" " #(~/.config/tmux/plugins/tmux-ssh-hostname/scripts/ssh_host.sh)"

source -F "$HOME/.config/tmux/plugins/tmux/utils/status_module.conf"
```

## Configuration

```bash
# Custom icon (default: "󰒋 ")
set -g @ssh_hostname_icon "🖥 "

# Custom color (default: pink)
set -g @ssh_hostname_color "#{@thm_green}"
```

## License

MIT
