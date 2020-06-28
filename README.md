# About

This is a fork of [tmux-urlview](https://github.com/tmux-plugins/tmux-urlview) with some more feaures:

- Not limited to `urlview` or `extract_url`
- Choose wether to use `split-window` or `run-shell`
- Let you choose where to save the buffer

The main motivation behind it is to be able to choose the url to open in dmenu.

# Configuration

- `urlview-key`: Key to bind tmux-urlview to
- `urlview-rsh`: Use `run-shell`? Unless set to "yes" it uses `split-window`
- `urlview-buf`: Where to save the buffer
- `urlview-cmd`: Which command to run (`urlview-buf` will be given as first parameter)

This is an example configuration with the default values:

```
set -g @urlview-key 'u'
set -g @urlview-rsh 'no'
set -g @urlview-buf '${TMPDIR:-/tmp}/tmux-buffer'
set -g @urlview-cmd 'urlview'

```