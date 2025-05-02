return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts =
    {
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false })
        end,
    },
    dependencies =
    {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
}
