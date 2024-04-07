-- require("keymaps")
-- require("plugins.lazy")
-- require("plugins.misc")
-- require("plugins.lualine")
-- require("options")
-- require("misc")
-- require("plugins.dap")
-- require("plugins.gitsigns")
-- require("plugins.tele")
-- require("plugins.treesitter")
-- require("plugins.lsp")
-- require("plugins.trouble")
-- require('plugins.ai')
-- require('plugins.cody')
-- require('plugins.copilot')
-- require('plugins.gpt')
-- require('plugins.nvim-llama')
-- require('plugins.obsidian')
-- require("plugins.zenmode")
-- require("plugins.leap")
-- require("plugins.ufo")

-- The following config stared from: https://github.com/LunarVim/Launch.nvim.
-- spec is a global lua function defined in user.launch and is a thin wrapper around require / lazy vim.
-- To remove a specific plugin, just comment a spec out.
-- It should be noted that you can use LSP things like 'gd' on a spec to jump to its definition or 'gpd' to preview it.
--
-- The prior style of config is still around for reference but I much prefer the modularity of the new spec style.
-- It's easy to add/remove plugins as needed.
require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
-- set the colorscheme
spec "user.colorscheme"
-- load dev icons
spec "user.devicons"
-- the venerable treesitter for parsing syntax
spec "user.treesitter"
-- load lsp binaries
spec "user.mason"
-- ultimately, provides code completion for well-known json/yaml files
spec "user.schemastore"
-- configure lsps
spec "user.lspconfig"
-- code completion config
spec "user.cmp"
-- the venerable telescope for fuzzy finding
spec "user.telescope"
-- spec "user.none-ls"
-- replacement for null-ls based code formatting
spec "user.conform"
-- window oriented replacement for cmdline, messages, popups
spec "user.noice"
-- smart highlighting for words thare are similar to what's under the cursor
spec "user.illuminate"
-- view git visual indicators in buffer (added/deleted/changed/blame, etc)
spec "user.gitsigns"
-- register keybindings in a way that they can then be displayed visually
spec "user.whichkey"
-- file explorer
spec "user.nvimtree"
-- smart commenting over multiple lines, text objects, etc.
spec "user.comment"
-- statusline
spec "user.lualine"
-- move quickly between important buffers
spec "user.harpoon"
-- spec "user.neotest"
-- spec "user.autopairs"
-- git workflow functionality
spec "user.neogit"
-- startup screen for neovim
spec "user.alpha"
-- spec "user.project"
-- indentation guides
spec "user.indentline"
-- persist and toggle multiple terminal windows (similar to tmux/zellij)
-- spec "user.toggleterm"
-- fast in-viewport navigation
spec "user.leap"
-- preview definitions/references etc. with lsps
spec "user.goto-preview"
-- auto-folding capabilities
spec "user.extras.ufo"
spec "user.extras.modicator"
-- code completion
spec "user.extras.codeium"
spec "user.extras.tabby"
-- smooth scrolling
spec "user.extras.neoscroll"
-- floating file explorer
spec "user.extras.oil"
spec "user.extras.cellular-automaton"
-- uses lsp to provide statusline enhancements
spec "user.navic"
-- used with navic to provide breadcrumbs
-- spec "user.breadcrumbs"
spec "user.extras.dropbar"

require "user.lazy"
