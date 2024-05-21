local colors = require("catppuccin.palettes").get_palette("mocha")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Lualine
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = "",
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    -- sections = {
    --   lualine_a = {
    --     { "mode", icon = "" },
    --   },
    sections = {
      -- these are to remove the defaults
      lualine_a = {
        {
          "mode",
          icon = "",
          color = function()
            local mode_color = {
              ["n"] = colors.sky,
              ["no"] = colors.sky,
              ["i"] = colors.green,
              ["ic"] = colors.green,
              ["t"] = colors.green,
              ["v"] = colors.flamingo,
              ["V"] = colors.flamingo,
              [""] = colors.flamingo,
              ["R"] = colors.maroon,
              ["Rv"] = colors.maroon,
              ["s"] = colors.maroon,
              ["S"] = colors.maroon,
              [""] = colors.maroon,
              ["c"] = colors.peach,
              ["cv"] = colors.peach,
              ["ce"] = colors.peach,
              ["r"] = colors.teal,
              ["rm"] = colors.teal,
              ["r?"] = colors.mauve,
              ["!"] = colors.green,
            }
            return { fg = mode_color[vim.fn.mode()], bg = "NONE" }
          end,
        },
      },
      lualine_b = {
        {
          LazyVim.lualine.pretty_path(),
          cond = conditions.buffer_not_empty,
          color = { fg = colors.muave, gui = "bold", bg = "NONE" },
        },
        {
          -- filesize component
          "filesize",
          cond = conditions.buffer_not_empty,
          color = { fg = colors.peach, bg = "NONE" },
        },
      },
      -- These will be filled later
      lualine_c = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " " },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.teal },
          },
        },
        {
          function()
            return "%="
          end,
        },
        {
          -- Lsp server name .
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config["filetypes"]
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = " LSP:",
          color = { fg = colors.blue, gui = "bold" },
        },
      },
      lualine_x = {
        { "location", color = { fg = colors.sapphire } },
        { "progress", color = { fg = colors.flamingo, gui = "bold" } },
      },
      lualine_y = {
        {
          "o:encoding", -- option component same as &encoding in viml
          fmt = string.upper, -- I'm not sure why it's upper case either ;)
          cond = conditions.hide_in_width,
          color = { fg = colors.green, gui = "bold", bg = "NONE" },
        },
        {
          "fileformat",
          fmt = string.upper,
          icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
          color = { fg = colors.green, gui = "bold", bg = "NONE" },
        },
      },
      lualine_z = {
        {
          "branch",
          icon = "",
          color = { fg = colors.lavender, gui = "bold", bg = "NONE" },
        },
        {
          "diff",
          -- Is it me or the symbol for modified us really weird
          symbols = { added = " ", modified = "󰝤 ", removed = " " },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.peach },
            removed = { fg = colors.red },
          },
          cond = conditions.hide_in_width,
          color = { bg = "NONE" },
        },
      },
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    extensions = {
      -- NeoTree
      {
        sections = {
          lualine_c = {
            {
              function()
                return "NeoTree"
              end,
              icon = "󱏒",
              color = { fg = colors.teal, gui = "bold" },
            },
            {
              function()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
              end,
              color = { fg = colors.muave, gui = "bold" },
            },
          },
        },
        filetypes = { "neo-tree" },
      },
      -- Lazy
      {
        sections = {
          lualine_c = {
            {
              function()
                return "Lazy 󰒲"
              end,
              color = { fg = colors.green, gui = "bold" },
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.lavender },
            },
          },
          lualine_x = {
            {
              function()
                return "Loaded:"
              end,
              color = { fg = colors.peach, gui = "bold" },
            },
            {
              function()
                local ok, lazy = pcall(require, "lazy")
                if not ok then
                  return ""
                end
                return lazy.stats().loaded .. "/" .. lazy.stats().count
              end,
              color = { fg = colors.sapphire },
            },
          },
        },
        filetypes = { "lazy" },
      },
    },
  },
}
