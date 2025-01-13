-- Set python line length to 88 (ruff default + my fave)
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 88,
        },
      },
    },
  },
})
