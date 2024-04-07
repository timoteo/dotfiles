local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}


function M.config()
  local servers = {
    "astro",
    "bashls",
    "cssls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "tsserver",
    "yamlls",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
