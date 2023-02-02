local utils = require('lib.utils')
local ts_utils = require('telescope.utils')
local fortune = ts_utils.get_os_command_output({ 'fortune' }, vim.loop.cwd())
local db = require('dashboard')
local spacing = { '', '' }

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '📓 Mind', group = '@property', action = 'MindOpenMain', key = 'm' },

      {
        desc = ' Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Grep',
        group = 'Label',
        action = 'Telescope live_grep',
        key = 'g',
      },
      {
        desc = ' Config',
        group = 'Number',
        action = 'e ~/.config/nvim/lua/user/plugins.lua',
        key = 'c',
      },
    },
    footer = utils.table_concat(spacing, fortune)
  },
})

-- db.session_directory = string.format("%s/.local/share/nvim/sessions", os.getenv("HOME"))
-- db.session_auto_save_on_exit = true
--
-- db.preview_command = 'cat'
-- db.preview_file_path = '~/.config/nvim/sunjon.cat'
-- db.preview_file_height = 10
-- db.preview_file_width = 70
