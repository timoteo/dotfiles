local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local mappings = {
    q = { "<cmd>confirm q<cr>", "Quit" },
    h = { "<cmd>nohlsearch<cr>", "NOHL" },
    [";"] = { "<cmd>tabnew | terminal<cr>", "Term" },
    s = {
      name = "Split",
      v = { "<cmd>vsplit<cr>", "Split vertically" },
      h = { "<cmd>split<cr>", "Split horizontally" },
      o = { "<cmd>only<cr>", "Close other windows" },
      e = { "<cmd>wincmd =<cr>", "Make windows equal size" },
      x = { "<cmd>close<cr>", "Close window" },
    },
    b = { name = "Buffers" },
    d = { name = "Debug" },
    f = { name = "Find" },
    g = { name = "Git" },
    l = { name = "LSP" },
    p = { name = "Plugins" },
    t = {
      name = "Tab",
      n = { "<cmd>tabnew<cr>", "Open new tab" },
      x = { "<cmd>tabclose<cr>", "Close tab" },
      l = { "<cmd>tabn<cr>", "Next tab" },
      o = { "<cmd>tabo<cr>", "Close other tabs" },
      h = { "<cmd>tabp<cr>", "Previous tab" },
      f = { "<cmd>tabnew %<cr>", "Open current buffer in new tab" },
    },
    T = { name = "Treesitter" },
    w = { name = "Workspaces" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
