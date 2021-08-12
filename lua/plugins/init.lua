require("plugins/packer_utils")

vim.cmd [[packadd packer.nvim]]
-- return require('packer').startup(function()
require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
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
      -- require('kommentary.config').use_extended_mappings()
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
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"

  use {
    "akinsho/nvim-toggleterm.lua", 
    config = function() 
      require"plugins/term"
    end
  }
  use {
    'GustavoKatel/telescope-asynctasks.nvim',
    requires = {{'skywind3000/asyncrun.vim'},{'skywind3000/asynctasks.vim'}, {'nvim-telescope/telescope.nvim'}},
    config = function()
      vim.g.asyncrun_open = 6
      vim.api.nvim_exec([[
      function! AsyncrunToggleTerm(opts) abort
	let cmd = '2TermExec '
	let cmd .= 'cmd="' . a:opts.cmd . '" '
	let cwd = (a:opts.cwd == '')? getcwd() : (a:opts.cwd)
	let cmd .= 'dir=' . fnameescape(cwd)
        execute cmd
      endfunction
      let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
      let g:asyncrun_runner.toggleterm = function('AsyncrunToggleTerm')
      let g:asynctasks_term_pos = 'toggleterm'
      ]], false)
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

