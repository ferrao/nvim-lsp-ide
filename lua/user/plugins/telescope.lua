local nkeymap = require('lib.utils').nkeymap
local telescope = require 'telescope'
local actions = require 'telescope.actions'

nkeymap('<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nkeymap('<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
nkeymap('<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
nkeymap('<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
nkeymap('<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
nkeymap('<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
nkeymap('<leader>fm', [[<cmd>lua require('telescope.builtin').media_files()<CR>]])

telescope.setup {
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/', 'node_modules/', '%.lock' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    lsp_handlers = {
      disable = {},
      location = {
        telescope = {},
        no_results_message = 'No references found',
      },
      symbol = {
        telescope = {},
        no_results_message = 'No symbols found',
      },
      call_hierarchy = {
        telescope = {},
        no_results_message = 'No calls found',
      },
      code_action = {
        telescope = require('telescope.themes').get_dropdown({}),
        no_results_message = 'No code actions available',
        prefix = '',
      },
    },
    media_files = {
      filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'pdf' },
      find_cmd = 'fd'
    }
  },
}

telescope.load_extension('fzf')
telescope.load_extension('lsp_handlers')
telescope.load_extension('media_files')
