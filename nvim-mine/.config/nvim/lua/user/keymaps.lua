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

