local status, cmp = pcall(require, "cmp")
if (not status) then 
  print("Cmp not installed")
  return end
-- local lspkind = require 'lspkind'

local source_map = {
    nvim_lsp = "[LSP]",
    nvim_lua = "[LUA]",
    buffer = "[BUFFER]",
    cmp_tabnine = "[TN]", -- not implemented 
    path = "[PATH]",
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    -- is it really neccessary??
    -- { name = "cmp_tabnine" },
	
    -- TODO: Install and configure snippet plugin
    -- { name = "ultisnip" },
  }),

  formatting = {
    format = function(entry, vim_item)
		    vim_item.kind = source_map[entry.source.name]
		    return vim_item
	    end
	   -- lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
