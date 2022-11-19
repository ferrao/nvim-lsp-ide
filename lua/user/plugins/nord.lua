local nord = require('nord')
local bufferline = require('bufferline')

local highlights = nord.bufferline.highlights({
  {
    fill = nord.nord0_gui,
    indicator = nord.nord9_gui,
    bg = nord.nord0_gui,
    buffer_bg = nord.nord0_gui,
    buffer_bg_selected = nord.nord1_gui,
    buffer_bg_visible = "#2A2F3A",
    bold = true,
    italic = true
  }
})

bufferline.setup({
  options = {
    separator_style = "slant"
  },
  highlights = highlights
})

-- Load the colorscheme
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_italic = true
vim.g.nord_italic_comments = true

nord.set()
vim.cmd [[colorscheme nord]]

-- Fix HTML highlight
vim.cmd [[highlight @tag gui=bold guifg=#81A1C1]]
vim.cmd [[highlight @tag.delimiter gui=bold guifg=#616E88]]
vim.cmd [[highlight @tag.attribute guifg=#B48EAD]]

-- Fix elixir syntax
vim.cmd [[highlight @function gui=italic guifg=#81A1C1]]
