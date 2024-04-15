local M = {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
}

M.config = function()
  require("nvim-autopairs").setup {
    check_ts = true,
    ts_config = {
      lua = { "string" }, -- don't add pairs in lua string treesitter nodes
      javascript = { "template_string" }, -- don't add pairs in javscript template_string
      java = false, -- don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
  }
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
