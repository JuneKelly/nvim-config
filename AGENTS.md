# Agent Guidance

This project is a configuration for Neovim with
[LazyVim](https://LazyVim.github.io/installation).

The user of this configuration uses neovim to edit primarily
[elixir](https://elixir-lang.org/) projects, usually with
[phoenix](https://www.phoenixframework.org/) and
[liveview](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html). The
user needs syntax highligting and LSP to work well when editing a project with
phoenix and liveview.

The user primarily uses MacOS.

The user prefers stability, dependability, and maintainability over flashy
features.

While assisting the user, think hard about the problem first before exploring
solutions. Search for documentation when necessary to enhance your
understanding. When faced with complex problems, make a plan before executing.

## Key files

- [/lazyvim.json]: Configuration for LazyVim extras
- [/lua/plugins/core.lua]: Configuration for specific plugins
- [/lua/plugins/lsp.lua]: Configuration for lsp
- [/lua/config/keymaps.lua]: Custom keymaps
- [/lua/config/lazy.lua]: Main configuration of LazyVim and associated packages
- [/lua/config/options.lua]: Neovim options and flags
