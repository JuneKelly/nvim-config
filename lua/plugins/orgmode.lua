return {
  -- nvim-orgmode: Org-mode clone for Neovim (agenda, capture, clocking)
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    keys = {
      { "<leader>oh", function() require("org_pickers").headlines() end, desc = "Org headlines (picker)" },
      { "<leader>of", function() Snacks.picker.files({ cwd = "~/orgfiles", title = "Org files" }) end, desc = "Org files" },
    },
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
        mappings = {
          -- Replaced by a snacks picker; see after/ftplugin/org.lua.
          org = { org_refile = false },
          capture = { org_capture_refile = false },
        },
        ui = {
          menu = {
            -- Orgmode's default menu is `echo` + blocking getchar(), which
            -- noice.nvim fails to render after the first use. Draw the menu in
            -- a float instead. Must stay synchronous and return the chosen
            -- action's result: fast-access TODO selection depends on it.
            handler = function(data)
              local lines, by_key, width = { data.title, "" }, {}, #data.title
              local separators = {}
              for _, item in ipairs(data.items) do
                if item.key then
                  local line = item.key .. "  " .. item.label
                  by_key[item.key] = item
                  width = math.max(width, vim.fn.strdisplaywidth(line))
                  table.insert(lines, line)
                else
                  table.insert(lines, "")
                  table.insert(separators, #lines)
                end
              end
              for _, i in ipairs(separators) do
                lines[i] = string.rep("-", width)
              end
              local buf = vim.api.nvim_create_buf(false, true)
              vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
              local win = vim.api.nvim_open_win(buf, false, {
                relative = "editor",
                row = math.floor((vim.o.lines - #lines) / 2),
                col = math.floor((vim.o.columns - width) / 2),
                width = width + 2,
                height = #lines,
                style = "minimal",
                border = "rounded",
              })
              vim.cmd.redraw()
              local ok, char = pcall(vim.fn.getcharstr)
              vim.api.nvim_win_close(win, true)
              vim.api.nvim_buf_delete(buf, { force = true })
              local item = ok and by_key[char]
              if item and item.action then
                return item.action()
              end
            end,
          },
        },
      })
      -- Experimental LSP support (completion, links, etc.)
      vim.lsp.enable("org")
    end,
  },

  -- Doom-style bullets instead of asterisks
  {
    "nvim-orgmode/org-bullets.nvim",
    ft = "org",
    opts = {},
  },

  -- Completion for tags, headlines, links, directives while typing
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = { org = { "orgmode", "buffer", "path" } },
        providers = {
          orgmode = {
            name = "Orgmode",
            module = "orgmode.org.autocompletion.blink",
            fallbacks = { "buffer" },
          },
        },
      },
    },
  },

  -- Labelled <leader>o groups so the mappings are discoverable
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>o", group = "org" },
        { "<leader>oi", group = "insert" },
        { "<leader>ol", group = "link" },
        { "<leader>on", group = "note" },
        { "<leader>ox", group = "clock" },
        { "<leader>ob", group = "babel" },
      },
    },
  },
}
