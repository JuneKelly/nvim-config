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
      -- Refresh automatically after relevant events
      auto_refresh = true,
    },
    config = function(_, opts)
      local neogit = require("neogit")
      neogit.setup(opts)

      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("neogit_push_refresh", { clear = true }),
        pattern = "NeogitPushComplete",
        callback = function()
          local status = neogit.status.instance()
          if status then
            -- Match Neogit's post-fetch delay so its one-second log cache can expire.
            status:deferred_refresh("push")()
          end
        end,
      })
    end,
  },

  -- Diffview: Side-by-side diff viewer (integrates with Neogit)
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
    },
    opts = {
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
        },
      },
    },
  },
}
