local M = {
  after = "catppuccin",
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
}

M.config = function()
  require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  }
end

return M
