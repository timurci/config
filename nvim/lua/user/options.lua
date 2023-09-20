vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.showtabline = 2
vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.timeoutlen = 1000
vim.opt.showmode = false

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.guifont = "monospace:h13"

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.shortmess:append "c"

vim.cmd [[
	autocmd TermOpen * startinsert
	autocmd TermOpen * setlocal nonumber
]]
