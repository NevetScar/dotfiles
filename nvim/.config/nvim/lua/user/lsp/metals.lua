local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
    filetypes = {'scala', 'sbt'},
}

require 'lspconfig'.metals.setup{
  on_attach = opts.on_attach;
  capabilities = opts.capabilities;
  filetypes = opts.filetypes;
}
