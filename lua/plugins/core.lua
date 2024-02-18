-- core plugin config

return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin",
      colorscheme = function()
        local tokyonight = require("tokyonight")
        tokyonight.setup({
          style = "moon",
          on_colors = function(c)
            c.border = c.fg_gutter
          end,
        })
        return tokyonight.load()
      end,
    },
  },
  {
    "folke/neoconf.nvim",
    opts = {
      import = {
        vscode = false,
      },
    },
  },
}
