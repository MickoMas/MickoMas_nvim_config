vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", "<CMD>Oil<CR>")

vim.keymap.set("n","<leader>zf", "<S-v>j%zf")

vim.keymap.set("t","<A-p>", "<C-\\><C-n>pi")
vim.keymap.set("i","<A-A>", "<ESC>A")
vim.keymap.set("i","<A-I>", "<ESC>I")
vim.keymap.set("i","<A-p>", "+")

--  --------------------TABS MANIPULATIONS--------------------
--{
    vim.keymap.set("n","<leader>tn", function ()
        vim.cmd.tabnew()
    end)

    vim.keymap.set("n","<leader>td", function ()
        vim.cmd.bdelete()
    end)

    vim.keymap.set({"n", "t"}, "<A-1>", vim.cmd.tabfirst)
    for i=2,10 do
          vim.keymap.set({"n", "t"}, string.format("<A-%i>", i % 10), function () vim.cmd.tabnext(i) end)
      end
    --}

vim.keymap.set("t","<A-Esc>", "<C-\\><C-n>")

-- vim.keymap.set("i", string.format("%c", 0),"") -- NUKE

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
--
for i=32,126 do
    if tonumber(string.format("%c", i)) == nil then
        vim.keymap.set("n", string.format("<A-%c>", i), string.format("<C-w>%c", i))
    end
end

vim.keymap.set("n", "<A-q>", "<CMD>bdelete<CR>")
vim.keymap.set("n", "<A-Q>", "<CMD>wincmd q<CR>")

-- vim.keymap.set("n", "<A-j>", "<CMD>wincmd j<CR>")
-- vim.keymap.set("n", "<A-k>", "<CMD>wincmd k<CR>")
-- vim.keymap.set("n", "<A-h>", "<CMD>wincmd h<CR>")
-- vim.keymap.set("n", "<A-l>", "<CMD>wincmd l<CR>")

-- vim.keymap.set("n", "<A-J>", "<CMD>wincmd J<CR>")
-- vim.keymap.set("n", "<A-K>", "<CMD>wincmd K<CR>")
-- vim.keymap.set("n", "<A-H>", "<CMD>wincmd H<CR>")
-- vim.keymap.set("n", "<A-L>", "<CMD>wincmd L<CR>")
-- vim.keymap.set("n", "<A-W>", "<CMD>wincmd W<CR>")
-- vim.keymap.set("n", "<A-w>", "<CMD>wincmd w<CR>")
