return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = true,
      integrations = {
        aerial = true,
        diffview = true,
        mini = {
          enabled = true,
          indentscope_color = "sky",
        },
        noice = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        notify = true,
        gitsigns = true,
        flash = true,
        blink_cmp = true,
        mason = true,
        snacks = true,
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            CursorLineNr = { fg = mocha.yellow },
            TelescopeSelection = { bg = mocha.surface0 },
            TelescopeSelectionCaret = { fg = mocha.yellow, bg = mocha.surface0 },
            TelescopePromptPrefix = { fg = mocha.yellow },
            FlashCurrent = { bg = mocha.peach, fg = mocha.base },
            FlashMatch = { bg = mocha.red, fg = mocha.base },
            FlashLabel = { bg = mocha.teal, fg = mocha.base },
            NormalFloat = { bg = mocha.base },
            FloatBorder = { bg = mocha.base },
            FloatTitle = { bg = mocha.base },
            RenderMarkdownCode = { bg = mocha.crust },
            Pmenu = { bg = mocha.surface0 },
            Comment = { bg = nil },
            statusline = { bg = nil },
          }
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
  },
}
