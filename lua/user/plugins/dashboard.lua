local utils = require('lib.utils')
local ts_utils = require('telescope.utils')
local fortune = ts_utils.get_os_command_output({ 'fortune' }, vim.loop.cwd())
local db = require('dashboard')

db.preview_command = 'cat'
db.preview_file_path = '~/.config/nvim/sunjon.cat'
db.preview_file_height = 10
db.preview_file_width = 70

db.custom_center = {
  { icon = ' ', desc = 'New File                    ', shortcut = '           ', action = 'enew' },
  { icon = ' ', desc = 'Reload Last Session         ', shortcut = '<Leader> sl', action = 'SessionLoad' },
  { icon = ' ', desc = 'Find File                   ', shortcut = '<Leader> ff', action = 'Telescope find_files' },
  { icon = ' ', desc = 'Recent Files                ', shortcut = '<Leader> sa', action = 'Telescope oldfiles' },
  { icon = ' ', desc = 'Find Word                   ', shortcut = '<Leader> fg', action = 'Telescope live_grep' },
  { icon = ' ', desc = 'Neovim Configuration        ', shortcut = '           ', action = 'e ~/.config/nvim.lua/lua/user/plugins.lua' },
}
local spacing = { '', '' }
db.custom_footer = utils.table_concat(spacing, fortune)
