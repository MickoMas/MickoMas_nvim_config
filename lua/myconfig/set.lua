vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = 'unnamedplus'

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

vim.diagnostic.config({virtual_text = true})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 2000
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
