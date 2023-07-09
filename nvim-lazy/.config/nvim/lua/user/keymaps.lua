local opts   = function(desc_)
  return { noremap = true, silent = true, desc = desc_}
end

local keymap = vim.api.nvim_set_keymap

--leader key mapped to space

keymap("", "<Space>", "<Nop>", opts("Leader key"))
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Left explorer

keymap("n", "<leader>e", ":Lex 30<cr>", opts("Trial explorer"))

-- Escape and save

keymap("i", "<C-s>", "<ESC>:w<CR>", opts("Escape and Save"))
keymap("x", "<C-s>", "<ESC>:w<CR>", opts("Escape and Save"))
keymap("v", "<C-s>", "<ESC>:w<CR>", opts("Escape and Save"))
keymap("n", "<C-s>", "<ESC>:w<CR>", opts("Escape and Save"))

-- Switch buffers
keymap("i", "<leader><C-i>", "<ESC>:bp<CR>", opts("Switch buffer"))
keymap("n", "<leader><C-i>", "<ESC>:bp<CR>", opts("Switch buffer"))
keymap("v", "<leader><C-i>", "<ESC>:bp<CR>", opts("Switch buffer"))
keymap("x", "<leader><C-i>", "<ESC>:bp<CR>", opts("Switch buffer"))

-- Clear highlight
keymap("n", "<leader>/", "<ESC>:nohl<CR>", opts("Clear highlight"))

-- Escape
keymap("i", "<leader>fj", "<ESC>", opts("Escape"))
keymap("x", "<leader>fj", "<ESC>", opts("Escape"))
keymap("v", "<leader>fj", "<ESC>", opts("Escape"))
keymap("n", "<leader>fj", "<ESC>", opts("Escape"))

-- LSP Keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local optss   = function(desc_)
      return {desc = desc_}
    end
    -- Displays hover information about the symbol under the cursor
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', optss("Hover info"))

    -- Jump to the definition
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', optss("Jump to definition"))

    -- Jump to declaration
    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', optss("Jump to declaration"))

    -- Lists all the implementations for the symbol under the cursor
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', optss("List implementation"))

    -- Jumps to the definition of the type symbol
    keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', optss("Jump to definition"))

    -- Lists all the references 
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', optss("List references"))

    -- Displays a function's signature information
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', optss("Function signature"))

    -- Renames all references to the symbol under the cursor
    keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', optss("Rename all references"))

    -- Selects a code action available at the current cursor position
    keymap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', optss("Select code action"))
    keymap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', optss("Select code action"))

    -- Show diagnostics in a floating window
    keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', optss("Show diagnostics"))

    -- Move to the previous diagnostic
    keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', optss("Go to prev diagnostic"))

    -- Move to the next diagnostic
    keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', optss("Go to next diagnostic"))
  end
})

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts("Find files"))
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts("Grep"))
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts("Find buffers"))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts("Find help tags"))
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts("Show git status"))
keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", opts("Document symbols"))
keymap("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<cr>", opts("Workspace symbols"))

local M = {}
-- Select and replace next word
-- function M.selectNextWord()
--   local word   = vim.fn.input('Enter word: ')
--   local result = vim.fn.searchpos(word, "nw")
--   vim.api.nvim_win_set_cursor(0,{result[1],result[2]-1})
--   vim.cmd("normal! ve")
--   local keys = vim.api.nvim_replace_termcodes("g<C-h>",true,false,true)
--   vim.api.nvim_feedkeys(keys,'m',false)
-- end
-- vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("user/keymaps").selectNextWord()<CR>', opts)

-- Align on a token
function M.alignT(t)
  local start          = vim.api.nvim_buf_get_mark(0,'<')[1]
  local endr           = vim.api.nvim_buf_get_mark(0,'>')[1]
  local greatestcolumn = 0
  local positionsofT   = {}
  for line = start, endr do
    vim.api.nvim_win_set_cursor(0,{line,0})
    local posix = vim.fn.searchpos(t,"n")
    if posix[2] > greatestcolumn then
      greatestcolumn = posix[2]
    end
    table.insert(positionsofT,posix)
  end
  for _, markpos in pairs(positionsofT) do
    vim.api.nvim_buf_set_text(0,markpos[1]-1,markpos[2]-1,markpos[1]-1,markpos[2]-1,{string.rep(' ',greatestcolumn - markpos[2])})
  end
end

-- Call alignT interactively
function M.alignLinesOnTokenInteractive()
    local token = vim.fn.input('Enter token: ')
    if token then
        M.alignT(token)
    else
        print('Invalid input')
    end
end

vim.api.nvim_set_keymap('v', '<leader>a', ':lua require("user/keymaps").alignLinesOnTokenInteractive()<CR>', opts("Align on token"))

return M

