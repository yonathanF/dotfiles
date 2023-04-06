-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- plugins
return packer.startup(function(use)
	-- lua functions
	use("nvim-lua/plenary.nvim")

	-- colorscheme
	use("drewtempelmeyer/palenight.vim")

	-- surround stuff quickly
	use("tpope/vim-surround")

	-- fast commenting
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- tabline for buffers
	use("ap/vim-buftabline")

	-- mark display
	use("kshenoy/vim-signature")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autoclose
	use("windwp/nvim-autopairs")

	-- coq love
	use("whonore/Coqtail")

	-- indent higlight
	use("echasnovski/mini.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- latex lang server
	use({
		"f3fora/nvim-texlabconfig",
		config = function()
			require("texlabconfig").setup()
		end,
		-- ft = { 'tex', 'bib' }, -- for lazy loading
		run = "go build",
		-- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
	})
	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
end)
