local cmp = require("cmp")

return {
  -- Mason
  { "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winblend = 0,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = {
          border = "rounded",
          winblend = 0,
        },
      },
      view = {
        docs = {
          auto_open = false,
        },
      },
      mapping = {
        ["<C-g>"] = function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end,
      },
    },
  },
}
