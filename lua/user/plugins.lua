local packer = require 'lib.packer'

-- Install your plugins here

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }                 -- Have packer manage itself
    use { 'airblade/vim-rooter' }                    -- Changes the working directory to the project root on file open
    use { 'farmergreg/vim-lastplace' }               -- Reopen files at last edit position
    use { 'tpope/vim-repeat' }                       -- Repeat plugin maps with '.'
    use { 'tpope/vim-surround' }                     -- Word surroundings
    use { 'tomtom/tcomment_vim' }                    -- Comment stuff out
    use { 'tpope/vim-sleuth' }                       -- Indent autodetection with editorconfig support
    use { 'nvim-lua/plenary.nvim' }                  -- Useful lua functions used by lots of plugins
    use { 'nvim-lua/popup.nvim' }                    -- An implementation of the Popup API from vim in Neovim
    use { 'kkoomen/vim-doge' }                       -- code documentation plugin, run :call doge#install() to install
    use { 'ellisonleao/glow.nvim', branch = 'main' } -- markdown viewer
    use { 'chrisbra/unicode.vim' }

    -- UI
    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup()
        end
    }

    use {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup()
        end
    }

    use { 'j-hui/fidget.nvim', tag = 'legacy' }

    -- LSP
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'b0o/schemastore.nvim',
            'folke/lsp-colors.nvim',
            'weilbith/nvim-code-action-menu',
            'folke/trouble.nvim',
            'j-hui/fidget.nvim',
        },
        config = function()
            -- pin nvim to OS node version, regardless of the project
            local node_bin = '/usr/bin/'
            vim.g.node_host_prog = node_bin
            vim.env.PATH = node_bin .. ":" .. vim.env.PATH


            require('mason').setup()
            require('mason-lspconfig').setup()
            require('user.plugins.lspconfig')
            require('user.plugins.trouble')
            require('fidget').setup {}
        end
    }

    -- Formatter
    use { 'mhinz/vim-mix-format' }

    use {
        'nvim-neotest/neotest',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
            'jfpedroza/neotest-elixir',
        },
        config = function()
            require('user.plugins.neotest')
        end
    }

    -- TreeSitter

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
        },
        config = function()
            require('user.plugins.cmp')
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require('user.plugins.luasnip')
        end
    }

    -- Theme

    use {
        'shaunsingh/nord.nvim',
        config = function()
            require('user.plugins.nord')
        end
    }

    use 'EdenEast/nightfox.nvim'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('user.plugins.lualine')
        end
    }

    use {
        'akinsho/bufferline.nvim', tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('user.plugins.bufferline')
        end
    }

    use { 'nvim-tree/nvim-web-devicons',
        config = function()
            require('user.plugins.devicons')
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('user.plugins.tree')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'gbrlsnchs/telescope-lsp-handlers' }

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

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('user.plugins.gitsigns')
        end,
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'


    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('user.plugins.dashboard')
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
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

    -- Tasks
    use {
        'phaazon/mind.nvim',
        branch = 'v2.2',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('user.plugins.mind')
        end
    }

    use {
        'vimwiki/vimwiki',
        config = function()
            require('user.plugins.vimwiki')
        end
    }
end)
