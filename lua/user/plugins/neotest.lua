local wk = require("which-key")

require("neotest").setup({
  adapters = {
    require("neotest-elixir")({
      -- Other formatters to pass to the test command as the formatters are overridden
      -- Can be a function to return a dynamic value.
      -- Default: {"ExUnit.CLIFormatter"}
      extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
      -- Extra arguments to pass to mix test
      -- Can be a function that receives the position, to return a dynamic value
      -- Default: {}
      args = { "--trace" },
      -- Delays writes so that results are updated at most every given milliseconds
      -- Decreasing this number improves snappiness at the cost of performance
      -- Can be a function to return a dynamic value.
      -- Default: 1000
      write_delay = 1000,
    })
  },
})

wk.register({
  u = {
    name = "Neotest",
    -- a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    -- F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
    -- N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
    -- L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
    l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
    o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
    S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  }
}, { prefix = "<leader>" })
