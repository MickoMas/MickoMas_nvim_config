vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop		= 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth	= 4
vim.opt.expandtab	= true
vim.opt.list        = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.listchars:append
{
    tab             = '> ',
}



-- NEW STAF

-- MyTabLine = function ()
-- 	local s = ''
-- 	for i = 1, vim.fn.tabpagenr('$') do
-- 		if i + 1 == vim.fn.tabpagenr() then
-- 			 s = s .. vim.fn.expand('%#TabLineSel#')
-- 		else
-- 			 s = s .. vim.fn.expand('%#TabLine#')
--
-- 		end
-- 		s = vim.fn.expand(s .. '%' .. (i + 1) .. 'T')
-- 	end
-- 	s = s .. vim.fn.expand('%#TabLineFill#') .. vim.fn.expand('%T')
-- 	if tab
-- 	return s
-- end
--
--
-- vim.o.tabline = "%!v:lua.MyTabLine()"
--
