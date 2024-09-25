-- Initialize lazy.nvim
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({
    -- Lazy can manage itself
    'folke/lazy.nvim',
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },


    { 'echasnovski/mini.nvim', version = false }, -- A set of modules, including animations
    -- Tokyo Night theme
    'folke/tokyonight.nvim',

    -- Treesitter with TSUpdate on build
    {
        'nvim-treesitter/nvim-treesitter',
    },
    'nvim-treesitter/playground',

    -- Harpoon
    'ThePrimeagen/harpoon',

    -- Undo Tree
    'mbbill/undotree',

    -- Fugitive
    'tpope/vim-fugitive',

-- LSP, Mason, and Completion setup
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim', build = ':MasonUpdate' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
    },
  },
    -- Rust tools
    'simrat39/rust-tools.nvim',

    -- Additional LSP and snippets support
    'saadparwaiz1/cmp_luasnip',
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' }
    },

    -- Debugging tools
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
-- Core Debugger Plugin (DAP)
  { 'mfussenegger/nvim-dap' },

  -- Optional: DAP UI for a better interface
 -- DAP UI for a better interface
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio' }, -- Add the nvim-nio dependency
  },
  -- Optional: DAP Virtual Text for inline virtual text during debugging
  { 'theHamsta/nvim-dap-virtual-text' },

  -- Optional: Install debuggers automatically via Mason
  { 'jay-babu/mason-nvim-dap.nvim', dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' } },

    -- Mason LSP support (repeated as dependencies)
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',

    -- Autotag for Treesitter
    'windwp/nvim-ts-autotag',

    -- Friendly snippets
    'rafamadriz/friendly-snippets',

    -- Auto pairs with lazy load on InsertEnter
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    { 'akinsho/bufferline.nvim' }, -- Bufferline for tab management
    { 'moll/vim-bbye' },
    -- Prettier neovim
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'goolord/alpha-nvim' },
    { 'onsails/lspkind-nvim' },
    { 'karb94/neoscroll.nvim' },
    { 'kyazdani42/nvim-tree.lua' },
    { 'kyazdani42/nvim-web-devicons' },
      { 'ahmedkhalf/project.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim' },
})

