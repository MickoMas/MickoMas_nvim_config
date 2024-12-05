-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'mfussenegger/nvim-dap'
	use ({
		'rebelot/kanagawa.nvim',
		as = 'kanagawa',
		config = function()
			vim.cmd('colorscheme kanagawa')
			vim.cmd('colorscheme kanagawa-dragon')
			vim.cmd('colorscheme kanagawa-wave')
			vim.cmd('colorscheme kanagawa-lotus')
		end
	})
	use 'tikhomirov/vim-glsl'
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}}

		use 'm4xshen/autoclose.nvim'
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		}

end)

