return
{
  "mrcjkb/haskell-tools.nvim",
  config = function()
    local ht = require('haskell-tools')
    local opts   = function(desc_, buff)
      return { noremap = true, silent = true, desc = desc_, buffer = buff}
    end
    local def_opts = function(desc_)
      return { noremap = true, silent = true, desc = desc_}
    end
    ht.setup {
      hls = {
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts("Code lens", bufnr))
          vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts("Hoogle signature", bufnr))
          vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts("Toggle repl"))
          vim.keymap.set('n', '<leader>rf',
                function ()
                  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
                end
                , def_opts("Focus repl"))
          vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts("Quit repl"))
        end,
      },
    }
  end
}

