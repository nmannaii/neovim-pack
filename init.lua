-- Leader must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Built-in package manager (Neovim 0.12+)
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons", -- icons (shared dependency)
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/max397574/better-escape.nvim",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/GustavEikaas/easy-dotnet.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/ThePrimeagen/git-worktree.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/coder/claudecode.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/tiagovla/scope.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/nvimdev/dashboard-nvim",
  "https://github.com/m00qek/baleia.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/iamcco/markdown-preview.nvim",
  "https://github.com/mistricky/codesnap.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("config.options")
require("config.ui")
require("config.keymaps")
require("config.lsp")
require("plugins.snacks")
require("plugins.mason")
require("plugins.neo-tree")
require("plugins.bufferline")
require("plugins.nvim-cmp")
require("plugins.better-escape")
require("plugins.diff-view")
require("plugins.dap")
require("plugins.telescope")
require("plugins.dotnet")
require("plugins.diagnostics")
require("plugins.conform")
require("plugins.treesitter")
require("plugins.catppucin")
require("plugins.overseer")
require("plugins.trouble")
require("plugins.session")
require("plugins.autopairs")
require("plugins.git")
require("plugins.claudecode")
require("plugins.lint")
require("plugins.markdown")
require("plugins.codesnap")
