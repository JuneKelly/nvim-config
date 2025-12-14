return {
  -- oil.nvim: Edit filesystem like a buffer (dired-like)
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory (Oil)" },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      -- Show hidden files by default
      view_options = {
        show_hidden = true,
      },
      -- Use trash instead of permanent delete
      delete_to_trash = true,
      -- Skip confirmation for simple operations
      skip_confirm_for_simple_edits = true,
      -- Keymaps within oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
      },
    },
  },
}
