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
