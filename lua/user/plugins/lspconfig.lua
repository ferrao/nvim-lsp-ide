local lspconfig = require 'lspconfig'
local nkeymap = require 'lib.utils'.nkeymap
local nbkeymap = require 'lib.utils'.nbkeymap
local allServers = require 'lib.servers'
local tablecopy = require 'lib.utils'.tablecopy
local tableremove = require 'lib.utils'.tableremove

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  nkeymap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
  nkeymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  nkeymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  nkeymap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nbkeymap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  nbkeymap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  nbkeymap(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  nbkeymap(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>')
  nbkeymap(bufnr, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  nbkeymap(bufnr, '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  nbkeymap(bufnr, '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  nbkeymap(bufnr, '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  nbkeymap(bufnr, '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  nbkeymap(bufnr, '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  nbkeymap(bufnr, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  nbkeymap(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  nbkeymap(bufnr, '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

-- 'setup' called on language servers to map buffer local keybindings
-- when the language server attaches

-- some language servers have specific configuration needs
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
}


-- Remove from servers the ones we have explecitely configured
local servers = tablecopy(allServers)
tableremove(servers, 'sumneko_lua')

-- Use a loop to conveniently call 'setup' on multiple servers
for _, lsp in pairs(servers) do
  -- print(lsp)
  lspconfig[lsp].setup {
    on_attach = on_attach
  }
end
