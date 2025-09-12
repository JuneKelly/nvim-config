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
  vim.fn.setreg(vim.v.register, vim.fn.expand("%") .. ":" .. vim.fn.line("."))
end, { desc = "Yank file path (with line)" })
