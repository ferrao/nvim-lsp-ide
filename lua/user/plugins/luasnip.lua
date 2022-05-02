local ls = require "luasnip"

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI'
}

ls.snippets = {
  typescript = {
    ls.parser.parse_snippet('import', "import $1 from '$0'"),
  }
}
