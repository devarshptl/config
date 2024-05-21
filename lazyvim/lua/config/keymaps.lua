-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap(
  "t",
  "<c-w>",
  "<c-\\><c-n><c-w>",
  { noremap = true, silent = true, desc = "Navigate non-terminal windows" }
)
