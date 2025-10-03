return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "nextls", -- Install Next LS through Mason
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable the default ElixirLS
        elixirls = {
          mason = false, -- Don't install via Mason
          enabled = false, -- Disable the server
        },
        -- Enable Next LS
        nextls = {
          mason = true, -- Install via Mason
          -- Optional settings for Next LS
          init_options = {
            experimental = {
              completions = {
                enable = true, -- Enable completions
              },
            },
          },
        },
      },
    },
  },
}
