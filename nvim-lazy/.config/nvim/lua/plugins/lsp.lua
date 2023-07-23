return
{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    build = ":MasonUpdate"
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_defaults = lspconfig.util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )
      -- Language servers
      lspconfig.marksman.setup({})
      lspconfig.hls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
      lspconfig.ltex.setup {
        settings = {
          ltex = {
            -- language = "en"
            language = "es"
          }
        }
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = 
      {
        bind = true,
        handler_opts = {
          border = "rounded"
        }
      }
  }
}
