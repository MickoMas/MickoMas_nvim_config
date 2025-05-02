return
{
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {'williamboman/mason.nvim'},
        { 'williamboman/mason-lspconfig.nvim' },
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    },
    config = function()

        local lsp_zero = require('lsp-zero')
        lsp_zero.preset('recommended')

        lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true
        })

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        -- to learn how to use mason.nvim
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {"clangd", "lua_ls"},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        })
        local cmp = require('cmp')

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            mapping = {
                ['<Tab>'] = cmp.mapping.confirm({select = true}),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                ['<C-p>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item({behavior = 'insert'})
                    else
                        cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item({behavior = 'insert'})
                    else
                        cmp.complete()
                    end
                end),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)

                end,
            },
        })

        require'lspconfig'.lua_ls.setup
        {
            settings =
            {
                Lua =
                {
                    -- runtime = {
                        --     path = {
                            --         '?.lua',
                            --         '?/init.lua',
                            --         vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
                            --         vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
                            --         '/usr/share/5.3/?.lua',
                            --         '/usr/share/lua/5.3/?/init.lua'
                            --     }
                            -- },
                            workspace =
                            {
                                checkThirdParty = false,

                                telemetry =
                                {
                                    enable = false
                                },

                                library =
                                {
                                    vim.env.VIMRUNTIME ..'/lua',
                                    vim.fn.expand "${3rd}/love2d/library",
                                    vim.fn.expand'~/.luarocks/share/lua/5.3',
                                    '/usr/share/lua/5.3'
                                }
                            }
                        }
                    }
                }

                require("lspconfig").fennel_ls.setup({})
                require("lspconfig").racket_langserver.setup({})


            end

        }



