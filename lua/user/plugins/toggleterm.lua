require('toggleterm').setup {
  open_mapping = [[<leader>t]],
  start_in_insert = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell -- change the default shell
}
