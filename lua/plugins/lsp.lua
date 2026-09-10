return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable default Elixir LSPs
        elixirls = {
          mason = false,
          enabled = false,
        },
        nextls = {
          mason = false,
          enabled = false,
        },
        -- Enable Expert (https://github.com/elixir-lang/expert)
        expert = {
          mason = false,
        },
      },
    },
  },
}
