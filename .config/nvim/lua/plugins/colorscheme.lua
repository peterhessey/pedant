-- return {
--   "sainnhe/everforest",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.everforest_enable_italic = true
--     vim.cmd("set background=dark")
--     vim.cmd("let g:everforest_background = 'hard'")
--     vim.cmd.colorscheme("everforest")
--   end,
-- }
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      -- Available flavors: latte, frappe, macchiato, mocha
      flavour = "mocha",
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      dim_inactive = {
        enabled = true,
        shade = "light",
        percentage = 0.4,
      },
      transparent_background = false,
      styles = {
        comments = { "italic" },
        conditionals = { "bold", "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      integrations = {
        nvimtree = true,
        cmp = true,
        gitsigns = true,
        mason = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      color_overrides = {},
      custom_highlights = {},
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
