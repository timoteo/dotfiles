local M = {
  -- "LunarVim/darkplus.nvim",
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  -- vim.cmd.colorscheme "darkplus"
  require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      alpha = true,
      cmp = true,
      dropbar = {
        enabled = true,
        color_mode = true,
      },
      gitsigns = true,
      illuminate = {
        enabled = true,
        lsp = true,
      },
      harpoon = true,
      leap = true,
      mason = true,
      navic = { -- note: must set highlight = true in navic
        enabled = true,
        custom_bg = "NONE",
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      neogit = true,
      noice = true,
      notify = true,
      nvimtree = true,
      telescope = true,
      ufo = true,
      which_key = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  }
  vim.cmd.colorscheme "catppuccin"
end

return M
