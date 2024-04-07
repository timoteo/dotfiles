local M = {
  "mawkler/modicator.nvim",
  dependencies = { "catppuccin/nvim" },
  event = "BufEnter",
}

function M.config()
  require("modicator").setup {
    show_warnings = false,
    highlights = {
      defaults = {
        bold = true,
        italic = false,
      },
    },
    integration = {
      lualine = {
        enabled = true,
        -- Letter of lualine section to use (if `nil`, gets detected automatically)
        mode_section = nil,
        -- Whether to use lualine's mode highlight's foreground or background
        highlight = "bg",
      },
    },
  }

  vim.api.nvim_create_autocmd({ "Colorscheme" }, {
    callback = function()
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#388bfd", bg = "NONE" })
    end,
  })
end

return M
