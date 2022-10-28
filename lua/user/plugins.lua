local packer = require 'lib.packer'

-- Install your plugins here

packer.startup(function(use)

    use { 'wbthomason/packer.nvim' } -- Have packer manage itself
    use { 'airblade/vim-rooter' } -- Changes the working directory to the project root on file open
    use { 'farmergreg/vim-lastplace' } -- Reopen files at last edit position
    use { 'tpope/vim-repeat' } -- Repeat plugin maps with '.'
    use { 'tpope/vim-surround' } -- Word surroundings
    use { 'tomtom/tcomment_vim' } -- Comment stuff out
    use { 'tpope/vim-sleuth' } -- Indent autodetection with editorconfig support
    use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins
    use { 'nvim-lua/popup.nvim' } -- An implementation of the Popup API from vim in Neovim
    use { 'kkoomen/vim-doge' } -- code documentation plugin, run :call doge#install() to install
    use { 'ellisonleao/glow.nvim', branch = 'main' } -- markdown viewer


    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup()
        end
    }

    -- LSP
    use {
        'williamboman/mason.nvim',
        requires = {
            'b0o/schemastore.nvim',
            'folke/lsp-colors.nvim',
            'weilbith/nvim-code-action-menu',
            'folke/trouble.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup()
            require('user.plugins.lspconfig')
            require('user.plugins.trouble')
        end
    }

    -- Elixir
    use {
        'mhinz/vim-mix-format'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
            require('user.plugins.treesitter')
            require('spellsitter').setup()
        end
    }

    -- Auto complete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp'
        },
        config = function()
            require('user.plugins.cmp')
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            require('user.plugins.luasnip')
        end
    }

    use {
        'shaunsingh/nord.nvim',
        config = function()
            require('user.plugins.nord')
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('user.plugins.lualine')
        end
    }

    use {
        'akinsho/bufferline.nvim', tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.bufferline')
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('user.plugins.tree')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'gbrlsnchs/telescope-lsp-handlers' },
            { 'nvim-telescope/telescope-media-files.nvim' }

        },
        config = function()
            require('user.plugins.telescope')
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('user.plugins.gitsigns')
        end,
    }

    use {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {}
        end,
    }

    use {
        'glepnir/dashboard-nvim',
        config = function()
            require('user.plugins.dashboard')
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('user.plugins.toggleterm')
        end
    }

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('user.plugins.todo-comments')
        end
    }

end)
