local lspconfig = require 'lspconfig'
local nbkeymap = require 'lib.utils'.nbkeymap
local ibkeymap = require 'lib.utils'.ibkeymap
local allServers = require 'lib.servers'
local tablecopy = require 'lib.utils'.tablecopy
local tableremove = require 'lib.utils'.tableremove

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  vim.cmd('command! LspDecl lua vim.lsp.buf.declaration()')
  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.format({ async = true })')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
  vim.cmd('command! LspDiagLoc lua vim.diagnostic.setloclist()')
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')

  -- Mappings.
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  nbkeymap(bufnr, '<leader>e', ':LspDiagLine<CR>')
  nbkeymap(bufnr, '[d', ':LspDiagPrev<CR>')
  nbkeymap(bufnr, ']d', ':LspDiagNext<CR>')
  nbkeymap(bufnr, '<leader>q', ':LspDiagLoc<CR>')


  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nbkeymap(bufnr, 'gD', ':LspDecl<CR>')
  nbkeymap(bufnr, 'gd', ':LspDef<CR>')
  nbkeymap(bufnr, 'gi', 'LspImplementation<CR>')
  nbkeymap(bufnr, 'gm', ':LspRename<CR>')
  nbkeymap(bufnr, 'gy', ':LspTypeDef<CR>')
  nbkeymap(bufnr, '<leader>d', ':LspHover<CR>')
  ibkeymap(bufnr, '<leader>s', ':LspSignatureHelp<CR>')
  nbkeymap(bufnr, 'ga', ':LspCodeAction<CR>')

  -- workspace ?????
  nbkeymap(bufnr, '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  nbkeymap(bufnr, '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  nbkeymap(bufnr, '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

  -- formatting

  -- format on save
  -- tsserver uses eslint lsp for formatting
  if client.name == 'eslint' then
    nbkeymap(bufnr, '<leader>p', ':EslintFixAll<CR>')

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function()
        vim.cmd(':EslintFixAll')
      end
    })
  elseif client.server_capabilities.documentFormattingProvider then
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })')
    nbkeymap(bufnr, '<leader>p', ':LspFormatting<CR>')
  end
end

-- 'setup' called on language servers to map buffer local keybindings
-- when the language server attaches

-- some language servers have specific configuration needs
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false, -- https://github.com/neovim/nvim-lspconfig/issues/1700
      }
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      -- is it possible to disable a specific suggestion only?
      disableSuggestions = true
    }
  }
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    }
  }
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false,
  };
}


-- Remove from servers the ones we have explecitely configured
local servers = tablecopy(allServers)
tableremove(servers, 'sumneko_lua') -- configured above
tableremove(servers, 'tsserver') -- configured above
tableremove(servers, 'jsonls') -- configured above
tableremove(servers, 'elixirls') -- configured above

-- Use a loop to conveniently call 'setup' on all the remaining servers
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
