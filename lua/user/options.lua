-- set var in global/window/buffer
vim.opt.foldlevelstart = 99

-- set var in global
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.signcolumn = 'yes:2'
vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 1
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.spell = false
vim.o.spelllang = 'en,pt'
vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = true
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.mouse = 'a'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.clipboard = 'unnamed' -- Use Linux system clipboard
vim.o.confirm = true
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.updatetime = 250 -- Decrease CursorHold delay
vim.o.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.o.showmode = false
vim.o.fillchars = 'eob: '
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.ruler = true
vim.o.backspace = 'indent,eol,start'
vim.g.dashboard_session_directory = vim.fn.stdpath 'data' .. '/sessions//'

-- set var in window
vim.wo.colorcolumn = '80'

-- set var in buffer
vim.bo.textwidth = 100
vim.bo.formatoptions = 'qrn1'
