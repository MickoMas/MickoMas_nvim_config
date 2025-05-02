return
{
    "t-troebst/perfanno.nvim",
    config = function()
        local perfanno = require("perfanno")
        local util = require("perfanno.util")

        perfanno.setup {
            -- Creates a 10-step RGB color gradient beween background color and "#CC3300"
            line_highlights = util.make_bg_highlights(nil, "#CC3300", 10),
            vt_highlight = util.make_fg_highlight("#CC3300"),
        }

        local keymap = vim.api.nvim_set_keymap
        local opts = {noremap = true, silent = true}

        keymap("n", "<LEADER>Plf", ":PerfLoadFlat<CR>", opts)
        keymap("n", "<LEADER>Plg", ":PerfLoadCallGraph<CR>", opts)
        keymap("n", "<LEADER>Plo", ":PerfLoadFlameGraph<CR>", opts)

        keymap("n", "<LEADER>Pe", ":PerfPickEvent<CR>", opts)

        keymap("n", "<LEADER>Pa", ":PerfAnnotate<CR>", opts)
        keymap("n", "<LEADER>Pf", ":PerfAnnotateFunction<CR>", opts)
        keymap("v", "<LEADER>Pa", ":PerfAnnotateSelection<CR>", opts)

        keymap("n", "<LEADER>Pt", ":PerfToggleAnnotations<CR>", opts)

        keymap("n", "<LEADER>Ph", ":PerfHottestLines<CR>", opts)
        keymap("n", "<LEADER>Ps", ":PerfHottestSymbols<CR>", opts)
        keymap("n", "<LEADER>Pc", ":PerfHottestCallersFunction<CR>", opts)
        keymap("v", "<LEADER>Pc", ":PerfHottestCallersSelection<CR>", opts)
    end

}
