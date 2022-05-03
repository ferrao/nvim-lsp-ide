local nkeymap = require('lib.utils').nkeymap
local vnkeymap = require('lib.utils').vnkeymap

-- sessions
nkeymap('<leader>ss', '<cmd>SessionSave<CR>');
nkeymap('<leader>sl', '<cmd>SessionLoad<CR>');

-- fast window movements
nkeymap('<c-j>', '<c-w>j');
nkeymap('<c-h>', '<c-w>h');
nkeymap('<c-k>', '<c-w>k');
nkeymap('<c-l>', '<c-w>l');
--
-- window resize
nkeymap('<m-lt>', ':exe "vertical resize " . (winwidth(0) * 4/3)<CR>');
nkeymap('<m->>', ':exe "vertical resize " . (winwidth(0) * 3/4)<CR>');
nkeymap('<m-+>', ':exe "resize " . (winheight(0) * 4/3)<CR>');
nkeymap('<m-->', ':exe "resize " . (winheight(0) * 3/4)<CR>');
nkeymap('<m-_>', ':exe "resize " . (winheight(0) * 3/4)<CR>');

-- increase/decrease indentation
vnkeymap('<', '<gv');
vnkeymap('>', '>gv');

-- toggle spell checking
nkeymap('<F10>', ':set spell!<CR>');
