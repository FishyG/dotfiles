
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

vim.opt.hlsearch = false
-- vim.opt.
-- vim.opt.
-- vim.opt.

vim.cmd.colorscheme("slate")

-- Remove the background so it's transparent
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = nil})

-- Set leader (TODO: learn what it is)
vim.g.mapleader = " "

-- Disable the thingy that say shit like "-- INSERT --" or wtv
vim.opt.showmode = false
