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

The plugin replaces `#{ssh_hostname}` with the actual hostname when the current pane is running SSH.

## License

MIT
