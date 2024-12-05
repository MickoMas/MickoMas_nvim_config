require('telescope').setup{
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
	}
}
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps',function()
--     builtin.grep_string({search = vim.fn.input("Find word > ")})
-- end)
--
-- vim.keymap.set('n', '<leader>bb', builtin.buffers)
--
-- vim.keymap.set('n', '<leader>gb', builtin.git_branches)
-- vim.keymap.set('n', '<leader>gs', builtin.git_status)
-- vim.keymap.set('n', '<leader>gc', builtin.git_commits)
-- vim.keymap.set('n', '<leader>gB', builtin.git_bcommits)
--
-- vim.keymap.set('n', '<leader><leader>', builtin.oldfiles)
--
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions)
--
