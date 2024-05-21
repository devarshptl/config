return {
  -- Mason
  { "mason-org/mason.nvim", opts = { ui = { border = "rounded" } } },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },

        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
}
