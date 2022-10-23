vim.cmd [[highlight BufferlineOffset guifg = '#81A1C1' guibg = '#2E3440']]

require('bufferline').setup {
  options = {
    indicator = {
      icon = ' '
    },
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
      background = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    fill = {
      background = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    tab = {
      background = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    close_button = {
      background = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    separator = {
      background = { attribute = 'bg', highlight = 'TabLineFill' },
    },
    modified = {
      background = { attribute = 'fg', highlight = 'DiffAdd' },
    },
    modified_selected = {
      background = { attribute = 'fg', highlight = 'DiffAdd' },
    },
  },
}
