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
      setup = {
        expert = function(_, opts)
          local configs = require("lspconfig.configs")
          if not configs.expert then
            configs.expert = {
              default_config = {
                cmd = { "expert", "--stdio" },
                filetypes = { "elixir", "eelixir", "heex" },
                root_dir = require("lspconfig").util.root_pattern("mix.exs", ".git"),
              },
            }
          end
          require("lspconfig").expert.setup(opts)
          return true
        end,
      },
    },
  },
}
