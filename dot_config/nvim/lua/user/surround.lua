local M = {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
}

function M.config()
  require("nvim-surround").setup()
end

return M
