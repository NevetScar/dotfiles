local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--leader key mapped to space

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Left explorer

keymap("n", "<leader>e", ":Lex 30<cr>", opts)


-- leave visual, insert and visual block with Ctrl-s
keymap("i", "", "<Esc>", opts)
keymap("x", "", "<Esc>", opts)
keymap("v", "", "<Esc>", opts)

-- create a line under and over to leave up and down

keymap("n", "n", "o<C-[>j<S-o>", opts)
keymap("n", "<leader>n", "o<Esc><S-o>", opts)

-- copy line down

keymap("n", "<leader>c", "yyp", opts)

-- visual mode move chunck up or down

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- normal mode move line up ro down

keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- visual block indent

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
