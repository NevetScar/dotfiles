 require "user.options"
 require "user.keymaps"
 require "user.plugins"
 require "user.colorscheme"
 require('lualine').setup()
 require('indent_blankline').setup({char = '▏',})
 require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
   'lua',
   'markdown',
   'haskell'
  },
 })
 require('gitsigns').setup()
 require "user.lsp"
 require "user.cmp"
