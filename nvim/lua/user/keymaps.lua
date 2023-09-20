local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes:
--  normal_mode         = "n"
--  insert_mode         = "i"
--  visual_mode         = "v"
--  visual_block_mode   = "x"
--  term_mode           = "t"
--  command_mode        = "c"

-- Normal --
-- Split navigation:
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split resize:
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vert resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vert resize -2<CR>", opts)

-- File explorer toggle:
--keymap("n", "<Leader>e", ":Lexplore 30<CR>", opts)
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Close buffer:
keymap("n", "<C-q>", ":q<CR>", opts)

-- Buffer navigation:
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move line:
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- Visual --

-- Move line:
keymap("v", "<A-j>", ":m .+1<CR>gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>gv", opts)

-- Indent and reenable visual mode:
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Visual Block --
-- Move block:
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<C-w>", "<C-\\><C-o><C-w>", opts) -- What?
keymap("t", "<C-w>N", "<C-\\><C-n>", opts)

-- Plugins --
-- Telescope:
keymap("n", "<Leader>f", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<C-t>", ":Telescope live_grep<CR>", opts)
