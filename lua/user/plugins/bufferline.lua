vim.cmd [[highlight BufferlineOffset guifg = '#81A1C1' guibg = '#2E3440']]

require('bufferline').setup {
  options = {
    indicator_icon = ' ',
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = 'BufferlineOffset',
        text_align = 'left',
      },
    },
    modified_icon = '',
    separator_style = 'thin',
    show_close_icon = false,
    custom_areas = {
      left = function()
        return {
          { text = '    ', guifg = '#8FBCBB' },
        }
      end,
    },
  },
  highlights = {
    background = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    fill = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    tab = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    close_button = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    separator = {
      guibg = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    modified = {
      guifg = { attribute = 'fg', highlight = 'DiffAdd' },
    },
    modified_selected = {
      guifg = { attribute = 'fg', highlight = 'DiffAdd' },
    },
  },
}
