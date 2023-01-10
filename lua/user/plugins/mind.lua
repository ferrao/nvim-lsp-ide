local mind = require 'mind'

mind.setup({
  persistence = {
    state_path = '~/.mind/mind.json',
    data_dir = '~/.mind/data',
  },

  ui = {
    width = 40,

    highlight = {
      node_root = 'Number',
    }
  },

  keymaps = {
    normal = {
      T = function(args)
        require 'mind.ui'.with_cursor(function(line)
          local tree = args.get_tree()
          local node = require 'mind.node'.get_node_by_line(tree, line)

          if node.icon == nil or node.icon == ' ' then
            node.icon = ' '
          elseif node.icon == ' ' then
            node.icon = ' '
          end

          args.save_tree()
          require 'mind.ui'.rerender(tree, args.opts)
        end)
      end,
    }
  }
})
