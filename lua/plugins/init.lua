require("plugins/packer_utils")

vim.cmd [[packadd packer.nvim]]
-- return require('packer').startup(function()
require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'
  use { 
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' 
  }
  use {
    'neovim/nvim-lspconfig',
    requires = 'kabouzeid/nvim-lspinstall',
    config = function()
      require'plugins/lsp'
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    requires = 'nevim/nvim-lspconfig',
    config = function()
      require'plugins/lspsaga'
    end
  }
  use {
    'hrsh7th/nvim-compe',
    config = function() 
      require'plugins/compe'
    end
  }
  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').use_extended_mappings()
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require'lualine'.setup {
        options = {
          theme = 'gruvbox',
          component_separators = {'', ''},
          section_separators = {'', ''},
        },
      }
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    config = function()
      require 'plugins/telescope'
    end
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"
  use {
    'voldikss/vim-floaterm',
    config = function()
      require "plugins/floaterm"
    end
  }
  use {
    'GustavoKatel/telescope-asynctasks.nvim',
    requires = {{'skywind3000/asyncrun.vim'}, {'skywind3000/asyncrun.extra'}, {'skywind3000/asynctasks.vim'}, {'nvim-telescope/telescope.nvim'}},
    config = function()
      vim.g.asyncrun_open = 6
      vim.g.asynctasks_term_pos = 'floaterm'
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

