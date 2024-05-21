return {
  "akinsho/bufferline.nvim",
  init = function()
    local bufline = require("catppuccin.groups.integrations.bufferline")
    bufline.get = bufline.get_theme
  end,
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      indicator = { style = "none" },
      separator_style = { "", "" },
    },
  },
}
