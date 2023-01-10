local nkeymap = require('lib.utils').nkeymap
local vnkeymap = require('lib.utils').vnkeymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- sessions
--
nkeymap('<leader>ss', '<cmd>SessionSave<CR>');
nkeymap('<leader>sl', '<cmd>SessionLoad<CR>');

-- fast window movements
nkeymap('<c-j>', '<c-w>j');
nkeymap('<c-h>', '<c-w>h');
nkeymap('<c-k>', '<c-w>k');
nkeymap('<c-l>', '<c-w>l');
--
-- window resize
nkeymap('<c-,>', ':exe "vertical resize " . (winwidth(0) * 4/3)<CR>');
nkeymap('<c-.>', ':exe "vertical resize " . (winwidth(0) * 3/4)<CR>');
nkeymap('<c-=>', ':exe "resize " . (winheight(0) * 4/3)<CR>');
nkeymap('<c-->', ':exe "resize " . (winheight(0) * 3/4)<CR>');

-- increase/decrease indentation
vnkeymap('<', '<gv');
vnkeymap('>', '>gv');


-- toggle spell checking
nkeymap('<F10>', ':set spell!<CR>');

-- clear search
nkeymap('<leader>n', ':nohlsearch<CR>')

-- manual formatters
nkeymap('<c-f>p', ':execute("%!prettier --stdin-filepath %")<CR>')
nkeymap('<c-f>h', ':execute("!htmlbeautifier -t 4 %")<CR>')
