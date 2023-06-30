local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--leader key mapped to space

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Left explorer

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Escape and save

keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("x", "<C-s>", "<ESC>:w<CR>", opts)
keymap("v", "<C-s>", "<ESC>:w<CR>", opts)
keymap("n", "<C-s>", "<ESC>:w<CR>", opts)

-- Switch buffers
keymap("i", "<leader><C-i>", "<ESC>:bp<CR>", opts)
keymap("n", "<leader><C-i>", "<ESC>:bp<CR>", opts)
keymap("v", "<leader><C-i>", "<ESC>:bp<CR>", opts)
keymap("x", "<leader><C-i>", "<ESC>:bp<CR>", opts)

-- Clear highlight
keymap("n", "<leader>/", "<ESC>:nohl<CR>", opts)

-- Escape
keymap("i", "<leader>fj", "<ESC>", opts)
keymap("x", "<leader>fj", "<ESC>", opts)
keymap("v", "<leader>fj", "<ESC>", opts)
keymap("n", "<leader>fj", "<ESC>", opts)

local M = {}
-- Select and replace next word
function M.selectNextWord()
  local word = vim.fn.input('Enter word: ')
  local result = vim.fn.searchpos(word, "nw")
  vim.api.nvim_win_set_cursor(0,{result[1],result[2]-1})
  vim.cmd("normal! ve")
  local keys = vim.api.nvim_replace_termcodes("g<C-h>",true,false,true)
  vim.api.nvim_feedkeys(keys,'m',false)
end
vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("user/keymaps").selectNextWord()<CR>', opts)

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
    vim.api.nvim_win_set_cursor(0,{markpos[1]-1,markpos[2]})
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

vim.api.nvim_set_keymap('v', '<leader>a', ':lua require("user/keymaps").alignLinesOnTokenInteractive()<CR>', opts)

return M
