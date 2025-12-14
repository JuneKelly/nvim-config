return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.surface2 },
        }
      end,
    },
  },
}
