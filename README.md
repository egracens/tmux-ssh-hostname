# tmux-ssh-hostname

Display SSH hostname in tmux status bar. Works with [Catppuccin](https://github.com/catppuccin/tmux) theme.

![screenshot](screenshot.png)

## Installation

Add to your `tmux.conf`:

```bash
set -g @plugin 'egracens/tmux-ssh-hostname'
```

Press `prefix + I` to install.

## Usage

Add to your status bar:

```bash
set -g status-right "#{?#{m:ssh,#{pane_current_command}},#{E:@catppuccin_status_ssh_host},}"
```

That's it! The hostname appears only when the current pane is running SSH.

## License

MIT
