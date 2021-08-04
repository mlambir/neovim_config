local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local wk = require("which-key")
  wk.register({
    ["<leader>"] = {
      c = {
        name = "+code",
        f = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "Lsp Finder" },
        a = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Action" },
        d = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "Hover Doc" },
        s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature Help" },
        r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      },
      w = {
        name = "+workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
        l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
      },
      ["="] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Code" },
    },
    gd = { "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", "Preview Definition" },
    gD = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
    gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
    cd = { "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", "Line Diagnostics" },
    ["[e"] = { "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", "Diagnostics Prev" },
    ["]e"] = { "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", "Diagnostics Next" },
    ["<C-f>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Saga Scroll Next" },
    ["<C-b>"] = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Saga Scroll Prev" },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
  }, 
  {buffer = bufnr})
  wk.register({
    ["<leader>"] = {
      c = {
        name = "+code",
        a = { ":<C-u>lua require('lspsaga.codeaction').range_code_action()<CR>", "Code Action" },
      },
    },
  }, 
  {buffer = bufnr, mode="v"})
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  local flags = {
          debounce_text_changes = 150,
        }
  for _, server in pairs(servers) do
    if server == 'efm' then
      require'lspconfig'[server].setup{
        on_attach = on_attach,
        init_options = {documentFormatting = true},
        flags = flags,
        filetypes = { 'python' },
        settings = {
          rootMarkers = {".git/"},
          languages = {
            python = {
              {formatCommand = "black --quiet -", formatStdin = true}
            }
          }
        }
      }
    else
      require'lspconfig'[server].setup{
        on_attach = on_attach,
        flags = flags
      }
    end
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
