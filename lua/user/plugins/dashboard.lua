local utils = require('telescope.utils')
local fortune = utils.get_os_command_output({ 'fortune' }, vim.loop.cwd())

vim.g.dashboard_preview_command = 'cat'
-- vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = '~/.config/nvim/sunjon.cat'
vim.g.dashboard_preview_file_height = 10
vim.g.dashboard_preview_file_width = 70

-- vim.g.dashboard_custom_header = {
--   ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
--   ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
--   ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
--   ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
--   ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
--   ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
-- }

vim.g.dashboard_custom_section = {
  a = { description = { '  New file                             ' }, command = 'enew' },
  b = { description = { '  Reload Last Session       <Leader> sl' }, command = 'SessionLoad' },
  c = { description = { '  Find file                 <Leader> ff' }, command = 'Telescope find_files' },
  d = { description = { '  Recent files              <Leader> fo' }, command = 'Telescope oldfiles' },
  e = { description = { '  Find Word                 <Leader> fg' }, command = 'Telescope live_grep' },
}

vim.g.dashboard_custom_footer = fortune
