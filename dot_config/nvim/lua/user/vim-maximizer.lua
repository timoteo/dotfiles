local M = {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", ":MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>sm"] = { ":MaximizerToggle<CR>", "Maximize/minimize a split" },
  }
end

return M
