return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_enable_italic = true
    vim.cmd("set background=dark")
    vim.cmd("let g:everforest_background = 'hard'")
    vim.cmd.colorscheme("everforest")
  end,
}
