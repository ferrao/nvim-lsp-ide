local packer = require 'lib.packer'

-- Install your plugins here

packer.startup(function(use)

    use { 'wbthomason/packer.nvim' } -- Have packer manage itself
    use { 'airblade/vim-rooter' } -- Changes the working directory to the project root on file open
    use { 'farmergreg/vim-lastplace' } -- Reopen files at last edit position
    use { 'tpope/vim-repeat' } -- Repeat plugin maps with '.'
    use { 'tpope/vim-surround' } -- Word surroundings
    use { 'tpope/vim-commentary' } -- Comment stuff out
    use { 'tpope/vim-sleuth' } -- Indent autodetection with editorconfig support
    use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins
    use { 'nvim-lua/popup.nvim' } -- An implementation of the Popup API from vim in Neovim

    -- LSP
    use {
        -- nvim-lsp-installer setup needs to be colocated with
        -- nvim-lspconfig to ensure proper plugin setup order
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            requires = {
                'b0o/schemastore.nvim',
                'folke/lsp-colors.nvim',
                'weilbith/nvim-code-action-menu',
            },
            config = function()
                require('nvim-lsp-installer').setup {}
                require('user.plugins.lspconfig')
            end
        }
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
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('user.plugins.tree')
        end
    }

end)
