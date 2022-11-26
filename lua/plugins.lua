-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "sharkdp/fd" } },
	})
	-- formatting, more info check the github.com
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("mfussenegger/nvim-dap")
	use({ "williamboman/mason.nvim" })
	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	})
	-- git diff
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	---------------up I get, blow I dont know---------

	-- Lazy loading:
	-- Load on specific commands
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	-- Load on an autocommand event
	use({ "andymass/vim-matchup", event = "VimEnter" })

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use({
		"w0rp/ale",
		ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
		cmd = "ALEEnable",
		config = "vim.cmd[[ALEEnable]]",
	})

	-- Plugins can have dependencies on other plugins
	use({
		"haorenW1025/completion-nvim",
		opt = true,
		requires = { { "hrsh7th/vim-vsnip", opt = true }, { "hrsh7th/vim-vsnip-integ", opt = true } },
	})

	-- You can specify rocks in isolation
	use_rocks("penlight")
	use_rocks({ "lua-resty-http", "lpeg" })

	-- Plugins can have post-install/update hooks
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Post-install/update hook with call of vimscript function with argument
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Use dependency and run lua function after load
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- You can alias plugin names
	use({ "dracula/vim", as = "dracula" })

	-- YC:
	use({ "neoclide/coc.nvim", branch = "release" })
	use("lervag/vimtex")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
