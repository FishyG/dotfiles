
-- Set the numbers on the side of the editor
vim.opt.number = true
vim.opt.relativenumber = true

-- Go to the next line when hitting the end of the line
--vim.opt.whichwrap={ "<", ">", "[", "]", "h", "l" }

-- Set the search to be case insensitive
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 5

vim.opt.hlsearch = true
-- vim.opt.
-- vim.opt.
-- vim.opt.

-- Disable line wrapping by default
vim.opt.wrap = false

-- Set leader (TODO: learn what it is)
vim.g.mapleader = " "

-- Disable the thingy that say shit like "-- INSERT --" or wtv
vim.opt.showmode = false

-- Set the clipboard to the system's clipboard
--vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<leader>y", "\"+y")

vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- I'm trying to do this :
--imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>
--
--
--But these are shit and don't work
--vim.api.nvim_set_keymap('i', '<C-C>', function() vim.cmd(string(eval(input("Calculate: ")))<CR>) end, { silent = true })
--vim.api.nvim_set_keymap('i', '<C-C>', '<Cmd>string(eval(input("Calculate: ")))<CR>', { silent = true })
