vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

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

	vim.keymap.set("n","<A-1>", function ()
		vim.cmd.tabfirst()
	end)

	vim.keymap.set("n","<A-2>", function ()
		vim.cmd.tabnext(2)
	end)

	vim.keymap.set("n","<A-3>", function ()
		vim.cmd.tabnext(3)
	end)

	vim.keymap.set("n","<A-4>", function ()
		vim.cmd.tabnext(4)
	end)

	vim.keymap.set("n","<A-5>", function ()
		vim.cmd.tabnext(5)
	end)

	vim.keymap.set("n","<A-6>", function ()
			vim.cmd.tabnext(6)
	end)

	vim.keymap.set("n","<A-7>", function ()
			vim.cmd.tabnext(7)
	end)

	vim.keymap.set("n","<A-8>", function ()
			vim.cmd.tabnext(8)
	end)

	vim.keymap.set("n","<A-9>", function ()
			vim.cmd.tabnext(9)
	end)

	vim.keymap.set("n","<A-0>", function ()
			vim.cmd.tabnext(10)
	end)
	--}

vim.keymap.set("t","<A-Esc>", "<C-\\><C-n>")



-- --------------------RENAME--------------------
-- {
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
-- }


-- --------------------COMPILE-------------------
-- {
vim.keymap.set("n", "<leader>sm", 
function()
	vim.ui.input({
		prompt = "Make: ",
	}, function (search)
		if search == nil then
			print("Escaped")
			return
		end
		CreateWindow()
		vim.cmd.term("make " .. search)
		vim.cmd.norm("i")
	end)
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
