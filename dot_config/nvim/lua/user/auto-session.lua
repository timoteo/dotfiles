local M = {
  "rmagatti/auto-session",
}

function M.config()
  require("auto-session").setup {
    auto_restore_enabled = true,
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/Desktop", "~/Documents" },
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
  }

  local wk = require "which-key"
  wk.register {
    ["<leader>fw"] = { "<cmd>lua require('auto-session.session-lens').search_session()<cr>", "Find workspace" },
    ["<leader>wr"] = { "<cmd>SessionRestore<cr>", "Restore workspace" },
    ["<leader>ws"] = { "<cmd>SessionSave<cr>", "Save workspace" },
  }
end

return M
