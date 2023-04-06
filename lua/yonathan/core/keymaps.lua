vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- the usuals
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>s", ":w<CR>")
keymap.set("n", "<leader>h", ":nohl<CR>")

-- x shouldn't copy
keymap.set("n", "x", '"_x')

-- increment and decrement
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- buffers
keymap.set("n", "<c-l>", ":bnext<CR>")
keymap.set("n", "<c-h>", ":bprev<CR>")
keymap.set("n", "<c-x>", ":bdelete<CR>")

-- movements
keymap.set("n", "B", "^")
keymap.set("n", "E", "$")

-- plugins
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
