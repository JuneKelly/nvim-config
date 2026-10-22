return {
  -- nvim-orgmode: Org-mode clone for Neovim (agenda, capture, clocking)
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })
      -- Experimental LSP support (completion, links, etc.)
      vim.lsp.enable("org")
    end,
  },
}
