vim.loader.enable()

function CreateWindow()
	vim.cmd.wincmd("n")
	vim.cmd.wincmd("J");
end

function CreateWorkspace()
	vim.cmd.wincmd("n")
	vim.cmd.wincmd("T");
end

require("myconfig")

require("lazy").setup("plugins")

-- vim.opt.mouse = ""


if vim.g.neovide then
	---------------------- SCALE FACTOR ----------------------
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.1)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1/1.1)
	end)


	---------------------- CONTRAST AND GAMMA ----------------------
	vim.g.neovide_text_gamma	= 0.0
	vim.g.neovide_text_contrast = 1.0


	---------------------- TRANSPARENCY ----------------------
	vim.g.neovide_opacity = 0.85


	---------------------- ANIMATION SCROLL ----------------------
	vim.g.neovide_scroll_animation_length = 0.25
	vim.g.neovide_scroll_animation_far_lines = 1


	---------------------- MOUSE HIDE ----------------------
	vim.g.neovide_hide_mouse_when_typing = true


	---------------------- ANIMATION MOUSE ----------------------
	vim.g.neovide_cursor_animation_length = 0.04
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_smooth_blink = true

end
