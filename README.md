# June's LazyVim Config

## LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Neovide project tabs

Native macOS tabs are enabled in `~/.config/neovide/config.toml`.
The fish function `~/.config/fish/functions/nvproject.fish` opens each project
in a new editor tab in the same Neovide application:

```fish
nvproject /path/to/project
nvproject # Open the current directory
```

Use `Cmd+Ctrl+N` for the Editors switcher, or `Cmd+Shift+[` / `Cmd+Shift+]`
to cycle native tabs. These are separate from Neovim's own tab pages.
