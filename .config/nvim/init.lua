vim.cmd.source("~/.config/nvim/ye-old-init.vim")
require("CopilotChat").setup {}

require("copilot").setup {}

require("lspconfig")["gdscript"].setup({
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", "6005"),
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

local dap = require("dap")

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Down>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<Up>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },

  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'buffer' },
  }
})


-- -- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.tsserver.setup {}

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<leader>nn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })

-- -- Setup nvim-cmp for autocompletion.

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local lspconfig = require('lspconfig')

-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     -- on_attach = my_custom_on_attach,
--     capabilities = capabilities,
--   }
-- end

-- -- luasnip setup
-- local luasnip = require 'luasnip'

-- -- nvim-cmp setup
-- local cmp = require 'cmp'
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
--     ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
--     -- C-b (back) C-f (forward) for snippet placeholder navigation.
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--   }),
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }

-- -- Show diagnostic popup on cursor hold
-- -- You will likely want to reduce updatetime which affects CursorHold
-- -- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = false,
-- })
