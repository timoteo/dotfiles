local M = {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
}

function M.config()
  require("dropbar").setup()
end

return M
