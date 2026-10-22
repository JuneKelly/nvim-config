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
        org_capture_templates = {
          t = { description = "Task (inbox)", template = "* TODO %?\n  %u" },
          n = { description = "Note", template = "* %?\n  %u", target = "~/orgfiles/notes.org" },
          j = {
            description = "Journal",
            template = "* %U\n%?",
            target = "~/orgfiles/journal.org",
            datetree = true,
          },
        },
      })
      -- Experimental LSP support (completion, links, etc.)
      vim.lsp.enable("org")
    end,
  },
}
