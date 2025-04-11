vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", "<CMD>Oil<CR>")

vim.keymap.set("n","<leader>zf", "<S-v>j%zf")

local tabcounter = 1

--  --------------------TABS MANIPULATIONS--------------------
--{
	vim.keymap.set("n","<leader>tn", function ()
		vim.cmd.tabnew()
		tabcounter = tabcounter + 1
		print("Tabs count: ", tabcounter)
	end)

	vim.keymap.set("n","<leader>td", function ()
		if tabcounter > 1 then
			vim.cmd.bdelete()
			tabcounter = tabcounter - 1
			print("Tabs count: ", tabcounter)
		end
	end)

	vim.keymap.set({"n", "t"}, "<A-1>", vim.cmd.tabfirst)
	for i=2,10 do
		  vim.keymap.set({"n", "t"}, string.format("<A-%i>", i % 10), function () vim.cmd.tabnext(i) end)
	  end
	--}

vim.keymap.set("t","<A-Esc>", "<C-\\><C-n>")
vim.keymap.set("t","<A-p>", "<C-\\><C-n>pi")


-- --------------------RENAME--------------------
-- {
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
-- }


-- --------------------COMPILE-------------------
-- {
vim.keymap.set("n", "<leader>sm", function()
		CreateWindow()
		vim.cmd.term("./build.sh")
		vim.cmd.norm("i")
	end)
-- }


-- --------------------SHELL COMMAND-------------------
-- {
vim.keymap.set("n", "<leader>ss", 
function()
    vim.ui.input({
		prompt = "Terminal: ",
		completion = "shellcmd",}, function (search)
			if search == nil then
				print("Escaped")
				return
			end
			local _, count = string.gsub(search, " ", " ")
			CreateWindow()

			if count == string.len(search) then
				vim.cmd.term()
			else
				vim.cmd.term(search)
			end
				vim.cmd.norm("i")
		end)
end)
-- }

-- --------------------SHELL COMMAND (new workspace)-------------------
-- {
vim.keymap.set("n", "<leader>sS", 
function()
    vim.ui.input({
		prompt = "Terminal: ",
		completion = "shellcmd",}, function (search)
			if search == nil then
				print("Escaped")
				return
			end
			local _, count = string.gsub(search, " ", " ")
			CreateWorkspace()

			if count == string.len(search) then
				vim.cmd.term()
			else
				vim.cmd.term(search)
			end
				vim.cmd.norm("i")
		end)
end)

-- }
RUN = "./test"
vim.keymap.set("n", "<leader>sr", 
function()
	CreateWindow()
	vim.cmd.term(RUN)
	vim.cmd.norm("i")

end)


-- --------------------MOVE WINDOW--------------------
-- vim.keymap.set("n", "<A-j>", ":wincmd j<Enter>")
-- vim.keymap.set("n", "<A-k>", ":wincmd k<Enter>")
-- vim.keymap.set("n", "<A-h>", ":wincmd h<Enter>")
-- vim.keymap.set("n", "<A-l>", ":wincmd l<Enter>")
-- 
-- vim.keymap.set("n", "<A-J>", ":wincmd J<Enter>")
-- vim.keymap.set("n", "<A-K>", ":wincmd K<Enter>")
-- vim.keymap.set("n", "<A-H>", ":wincmd H<Enter>")
-- vim.keymap.set("n", "<A-L>", ":wincmd L<Enter>")
