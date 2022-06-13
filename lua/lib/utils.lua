local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

M.buf_keymap = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

M.nkeymap = function(key, map)
  M.keymap('n', key, map, { noremap = true, silent = true })
end

M.vnkeymap = function(key, map)
  M.keymap('v', key, map, { noremap = true })
end

M.nbkeymap = function(bufnr, key, map)
  M.buf_keymap(bufnr, 'n', key, map, { noremap = true })
end

M.ibkeymap = function(bufnr, key, map)
  M.buf_keymap(bufnr, 'i', key, map, { noremap = true })
end

M.tablecopy = function(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in pairs(orig) do
      copy[orig_key] = orig_value
    end
  else -- number, string, boolean, etc
    copy = orig
  end

  return copy
end

M.tableremove = function(array, item)
  local function tablefind(tbl, el)
    for index, value in pairs(tbl) do
      if value == el then
        return index
      end
    end
  end

  table.remove(array, tablefind(array, item))
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.table_concat = function(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end


return M
