local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer, please reopen Neovim."
	vim.cmd [[packadd packer.nvim]]
end

-- Reload neovim when plugins.lua is saved
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify(
		"Warning: packer is not found.",
		vim.log.levels.WARN
	)
	return
end

-- Initialize
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end,
	}
}

return packer.startup(function(use)
	-- Plugins

	-- Core / Dependencies
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	-- Misc.
	use "windwp/nvim-autopairs"
	use "numToStr/Comment.nvim"
	use "nvim-tree/nvim-web-devicons"
	use "nvim-tree/nvim-tree.lua"

	-- Colorschemes
	use "rebelot/kanagawa.nvim"
	use "ellisonleao/gruvbox.nvim"
	use "savq/melange-nvim"
	use "ray-x/aurora"
	use "nyoom-engineering/oxocarbon.nvim"
	use "EdenEast/nightfox.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"

	-- snippets
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim" -- LSP installer
	use "williamboman/mason-lspconfig.nvim" -- LSP installer
	use "jose-elias-alvarez/null-ls.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "p00f/nvim-ts-rainbow"

	-- Git
	use "lewis6991/gitsigns.nvim"

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
