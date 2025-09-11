return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = function()
      --   local tokyonight = require("tokyonight")
      --   tokyonight.setup({
      --     style = "moon",
      --     on_colors = function(c)
      --       c.border = c.fg_gutter
      --     end,
      --   })
      --   return tokyonight.load()
      -- end,
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
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = { width = 0.9 },
    },
  },
}
