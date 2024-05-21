-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Cursor
local cursorGroup = augroup("CursorGroup", { clear = true })
autocmd("VimLeave", {
  group = cursorGroup,
  command = "set guicursor=a:hor10-blinkwait100-blinkoff500-blinkon500",
})
