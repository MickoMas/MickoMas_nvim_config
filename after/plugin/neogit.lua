local neogit = require('neogit')

-- open using defaults
vim.keymap.set("n", "<leader>gg", function()neogit.open({kind = "floating"}) end)

-- open a specific popup
-- neogit.open({ "commit" })
--
-- -- open as a split
-- neogit.open({ kind = "split" })
--
-- -- open with different project
-- neogit.open({ cwd = "~" })
