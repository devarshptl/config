require("lspconfig.ui.windows").default_options.border = "rounded"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {},
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    opts = {
      watermark = "",
      code_font_family = "SauceCodePro Nerd Font",
    },
    keys = {
      { "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cS", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },
}
