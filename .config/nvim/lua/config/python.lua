return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              -- Keep these for functionality:
              autoImportCompletions = true,
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              
              -- Performance optimizations:
              typeCheckingMode = "basic", -- vs "strict"
              diagnosticMode = "openFilesOnly", -- vs "workspace" 
              
              -- Only exclude actual project junk:
              exclude = {
                "**/__pycache__",
                "**/node_modules", 
                "**/*.pyc",
                ".git",
                ".pytest_cache",
                ".mypy_cache"
              },
              -- DON'T exclude .venv - pyright handles this automatically
            }
          }
        }
      }
    }
  }
}
