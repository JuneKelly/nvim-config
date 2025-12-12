return {
  -- Disable lazygit keymaps from snacks.nvim
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gg", false },
      { "<leader>gG", false },
    },
  },

  -- Neogit: Magit-like git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
    },
    opts = {
      integrations = {
        diffview = true,
        fzf_lua = true,
      },
      -- Remember window size/position
      remember_settings = true,
      -- Auto refresh on focus
      auto_refresh = true,
    },
  },

  -- Diffview: Side-by-side diff viewer (integrates with Neogit)
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
    },
    opts = {},
  },
}
