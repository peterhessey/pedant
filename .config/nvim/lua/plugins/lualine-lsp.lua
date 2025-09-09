return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Add LSP status to lualine
    local function lsp_status()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end
      
      local client_names = {}
      for _, client in pairs(clients) do
        table.insert(client_names, client.name)
      end
      
      return "󰒍 " .. table.concat(client_names, ", ")
    end
    
    -- Insert LSP status into lualine_x section
    table.insert(opts.sections.lualine_x, lsp_status)
    
    return opts
  end,
}