-- Vim's default 'comments' contains "mb:*" (middle of a C comment), so with
-- formatoptions r/o every org headline ("* ...") gets continued with "* " on
-- Enter. Org only has "# " comments; "fb:-" keeps continuation lines of a
-- "- " list item aligned under its text.
vim.opt_local.comments = "b:#,fb:-"

-- Picker-based refile (orgmode's own org_refile / org_capture_refile are
-- disabled in lua/plugins/orgmode.lua).
vim.keymap.set("n", "<leader>or", function()
  require("org_pickers").refile()
end, { buffer = true, desc = "Org refile (picker)" })
