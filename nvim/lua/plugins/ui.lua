local cmp = require("cmp")

local dashboard_custom_header = [[


=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                       D E V A R S H                        \/   `==
\____-'                                                                `-____/
]]

return {
  -- Dashboard
  -- {
  --   "nvimdev/dashboard-nvim",
  --   opts = {
  --     config = {
  --       header = vim.split(dashboard_custom_header, "\n"),
  --     },
  --   },
  -- },
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
      colors = {
        gray = "#5c6370",
      },
      highlights = {
        DashboardHeader = { fg = "${green}" },
        DashboardIcon = { fg = "${yellow}" },
        DashboardDesc = { fg = "${blue}" },
        DashboardKey = { fg = "${orange}" },
        DashboardFooter = { fg = "${purple}" },
        PmenuSel = { bg = "${gray}" },
        CmpItemMenu = { fg = "${red}" },
        NeoTreeDimText = { fg = "${gray}" },
        NeoTreeMessage = { fg = "${gray}" },
        NeoTreeDotFile = { fg = "${gray}" },
        Visual = { bg = "${gray}" },
        WhichKeyFloat = { bg = "${bg}" },
        StatusLine = { bg = "${bg_statusline}" },
      },
    },
  },
  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
      },
    },
  },
  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
      },
    },
  },
  -- Mason
  { "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
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
  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "rounded",
        margin = { 1, 1, 1, 1 },
      },
    },
  },
}
