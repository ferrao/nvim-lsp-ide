vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_italic_comments = true


-- Find a way to make this theme override work?
-- local nord = require("nord.colors")
-- treesitter["@function"] = { fg = nord.nord9_gui, style = "italic" }

-- Load the colorscheme
require('nord').set()

vim.cmd [[colorscheme nord]]
