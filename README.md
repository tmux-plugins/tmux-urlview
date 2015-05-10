# Tmux urlview

Plugin wrapper around [urlview](https://github.com/sigpipe/urlview).

Quickly open any url on your terminal window!

### Demo

[![Demo tmux-urlview](http://g.recordit.co/5Uh5W4oaPR.gif)](http://recordit.co/5Uh5W4oaPR)

### Dependencies

- `urlview` - `brew install urlview` on OS X.

### Key bindings

In any tmux mode:

- `u` - "urlview" for a side-panel listing all urls


### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "          \
      tmux-plugins/tpm             \
      jbnicolai/tmux-urlview       \
    "

Hit `prefix + I` to fetch the plugin and source it. You should now be able to
use the plugin.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/jbnicolai/tmux-urlview ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/open.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

You should now be able to use the plugin.

### Configuration

> How can I change the default "i" key binding to something else? For example,
> key "x"?

Put `set -g @urlview-key 'x'` in `tmux.conf`.

### Other goodies

`tmux-open` works great with:

- [tmux-fpp](https://github.com/jbnicolai/tmux-fpp) - a plugin for
  opening any files on your terminal window
- [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) - a plugin for
  regex searches in tmux and fast match selection
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - enables copying
  highlighted text to system clipboard

### License

[MIT](LICENSE.md)
