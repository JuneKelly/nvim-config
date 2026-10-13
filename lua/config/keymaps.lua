-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>fy", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:."))
end, { desc = "Yank file path" })

map("n", "<leader>fYy", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:p"))
end, { desc = "Yank file path (full)" })

map("n", "<leader>fYl", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:.") .. ":" .. vim.fn.line("."))
end, { desc = "Yank file path (with line)" })

if vim.g.neovide then
  local function scale(factor)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * factor
  end
  local modes = { "n", "v", "i", "t" }
  map(modes, "<D-=>", function() scale(1.1) end, { desc = "Neovide zoom in" })
  map(modes, "<D-->", function() scale(1 / 1.1) end, { desc = "Neovide zoom out" })
  map(modes, "<D-0>", function() vim.g.neovide_scale_factor = 1.0 end, { desc = "Neovide zoom reset" })
end
