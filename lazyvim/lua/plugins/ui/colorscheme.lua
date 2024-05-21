return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true, -- enables transparency on floating windows
        solid = true,
      },
      term_colors = true,
      custom_highlights = function(colors)
        return {
          DashboardHeader = { fg = colors.mauve },
          NeoTreeDimText = { fg = colors.overlay0 },
          NeoTreeMessage = { fg = colors.overlay0 },
          NeoTreeDotFile = { fg = colors.overlay0 },
        }
      end,
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
}
