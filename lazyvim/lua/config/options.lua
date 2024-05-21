-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.o.guifont = "SauceCodePro_Nerd_Font:h13"
vim.o.termguicolors = true
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:hor10-blinkon500-blinkoff500-TermCursor"
vim.o.completeopt = "menu,menuone,noinsert"

-- Neovide
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_show_border = true
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_window_blurred = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
