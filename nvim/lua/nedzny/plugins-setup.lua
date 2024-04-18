local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
	return
end


return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	--lua functions that many plugins use
	use("nvim-lua/plenary.nvim")
    --java 
    use ("mfussenegger/nvim-jdtls")
    use {'artur-shaik/jc.nvim'}
    --import const
    use("yardnsm/vim-import-cost")
	--color scheme
  -- use({
	 --  'rose-pine/neovim',
	 --  as = 'rose-pine',
	 --  config = function()
		--   vim.cmd('colorscheme rose-pine')
	 --  end
  -- })
--   use("bluz71/vim-nightfly-colors")
-- use { "catppuccin/nvim", as = "catppuccin" }
	--tmux & split window navigation
    use{"ellisonleao/gruvbox.nvim"} 
	use("christoomey/vim-tmux-navigator")

    --harpoon

  use("theprimeagen/harpoon")
	--maximizes and restores current window
	use("szw/vim-maximizer")

	--esential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	--commenting with gc
	use("numToStr/Comment.nvim")

	use("nvim-tree/nvim-tree.lua")
	--icons
	use("kyazdani42/nvim-web-devicons")

	--statusLine
	use("nvim-lualine/lualine.nvim")

	--fuzzy finding

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
      use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
    --new lsp
     use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'rafamadriz/friendly-snippets'},
	  }
  }
    use("ray-x/go.nvim")

use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.1.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
--markdown preview

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("OmniSharp/omnisharp-vim")
    use('dense-analysis/ale')
--	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion


	--formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
    use('MunifTanjim/prettier.nvim')
    --vim be good 
    use('ThePrimeagen/vim-be-good')
    --prisma
    use('pantharshit00/vim-prisma')
	--brackets pairing
	use("lukas-reineke/indent-blankline.nvim")

    --color css highlight
    use('norcalli/nvim-colorizer.lua')
	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
    use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
})
	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	--git signs plugin
--	use("lewis6991/gitsigns.nvim")
	--autosave
use {
  "ray-x/lsp_signature.nvim",
}
use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
