local configs = require 'nvim-treesitter.configs'

local parsers = {
    'bash'; 'dot'; 'dockerfile'; 'yaml'; 'vim'; 'regex'; 'markdown';
    'make'; 'c'; 'cpp';
    'http'; 'html'; 'css';
    'javascript'; 'tsx'; 'typescript'; 'jsdoc'; 'json'; 'json5'; 'prisma'; 'graphql';
    'elixir'; 'erlang'; 'heex'; 'eex';
    'java'; 'lua'; 'php';
};

configs.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = parsers,
    auto_install = true,
    sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    },

    context_commentstring = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },
    textobjects = { enable = true, lookahead = true }
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
