local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      theme = "catppuccin",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
      lualine_b = { "filename", "branch", "diff", "diagnostics" },
      lualine_c = { require("auto-session.lib").current_session_name },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
