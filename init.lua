function CreateWindow()
	vim.cmd.wincmd("n")
end

function CreateWorkspace()
	vim.cmd.wincmd("n")
	vim.cmd.wincmd("T");
end

require("myconfig")

vim.lsp.enable('luals')

if vim.g.neovide then
	vim.g.neovide_no_idle = true
	vim.g.neovide_refresh_rate = 60
end

