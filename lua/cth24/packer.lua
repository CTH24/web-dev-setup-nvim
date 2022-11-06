-- plugins.lua

local status, packer = pcall(require, "packer")

if not status then
    print("Packer is not installed")
    return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
    --------------------------------------------------------------------------------
    -- Packer
    --------------------------------------------------------------------------------

    use("wbthomason/packer.nvim")

    use("tpope/vim-surround")
    use("numToStr/Comment.nvim")

    --------------------------------------------------------------------------------
    -- Copilot
    --------------------------------------------------------------------------------

    use({
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup({
                    panel = {
                        enabled = true,
                        auto_refresh = true,
                        keymap = {
                            jump_prev = "[[",
                            jump_next = "]]",
                            accept = "<CR>",
                            refresh = "gr",
                            open = "<M-CR>",
                        },
                    },
                    suggestion = {
                        enabled = false,
                        auto_trigger = false,
                        debounce = 100,
                        keymap = {
                            accept = "<C-[>",
                            next = "<C-9>",
                            prev = "<C-0>",
                            dismiss = "<C-]>",
                        },
                    },
                    filetypes = {
                        yaml = false,
                        markdown = false,
                        help = false,
                        gitcommit = false,
                        gitrebase = false,
                        hgcommit = false,
                        svn = false,
                        cvs = false,
                        ["."] = false,
                    },
                    copilot_node_command = "node", -- Node version must be < 18
                    plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
                    server_opts_overrides = {},
                })
            end, 100)
        end,
    })

    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup({
                method = "getCompletionsCycling",
            })
        end,
    })

    --------------------------------------------------------------------------------
    -- LuaSnip                                                                     -
    --------------------------------------------------------------------------------

    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    --------------------------------------------------------------------------------
    -- LSP
    --------------------------------------------------------------------------------

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    --use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")
    use("ray-x/lsp_signature.nvim")

    --------------------------------------------------------------------------------
    -- Linting & Formatting                                                        -
    --------------------------------------------------------------------------------

    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    --------------------------------------------------------------------------------
    -- CMP                                                                         -
    --------------------------------------------------------------------------------

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp")

    --------------------------------------------------------------------------------
    -- NvimTree
    --------------------------------------------------------------------------------

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        tag = "nightly",
    })

    --------------------------------------------------------------------------------
    -- navic (Statusline)                                                          -
    --------------------------------------------------------------------------------

    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    --------------------------------------------------------------------------------
    -- nvim-web-devicons
    --------------------------------------------------------------------------------

    use("kyazdani42/nvim-web-devicons") -- File icons

    --------------------------------------------------------------------------------
    -- nvim-autopairs
    --------------------------------------------------------------------------------

    use("windwp/nvim-autopairs")

    --------------------------------------------------------------------------------
    -- nvim-autopairs
    --------------------------------------------------------------------------------

    use("windwp/nvim-ts-autotag")

    --------------------------------------------------------------------------------
    -- nvim-colorizer
    --------------------------------------------------------------------------------

    use("norcalli/nvim-colorizer.lua")

    --------------------------------------------------------------------------------
    -- zen-mode
    --------------------------------------------------------------------------------

    use("folke/zen-mode.nvim")

    --------------------------------------------------------------------------------
    -- gitsigns
    --------------------------------------------------------------------------------

    use("lewis6991/gitsigns.nvim")

    --------------------------------------------------------------------------------
    -- git
    --------------------------------------------------------------------------------

    --use("dinhhuy258/git.nvim")
    use("tpope/vim-fugitive")
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

    --------------------------------------------------------------------------------
    -- telescope
    --------------------------------------------------------------------------------

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    --------------------------------------------------------------------------------
    -- wilder
    --------------------------------------------------------------------------------

    use("gelguy/wilder.nvim")
    use("romgrk/fzy-lua-native")
    use({
        "rinx/nvim-ripgrep",
        config = function()
            require("nvim-ripgrep").setup({
                open_qf_fn = require("nvim-ripgrep.extensions").trouble_open_qf,
            })
        end,
    })

    --------------------------------------------------------------------------------
    -- alpha-nvim
    --------------------------------------------------------------------------------

    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    })

    --------------------------------------------------------------------------------
    -- Themes
    --------------------------------------------------------------------------------

    use("Shatur/neovim-ayu")
    use("ellisonleao/gruvbox.nvim")
    use("rebelot/kanagawa.nvim")

    --------------------------------------------------------------------------------
    -- express_line
    --------------------------------------------------------------------------------

    use("tjdevries/express_line.nvim")

    --------------------------------------------------------------------------------
    -- ToggleTerm
    --------------------------------------------------------------------------------

    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                shell = vim.o.shell,
                direction = "float",
                winblend = 1,
            })
        end,
    })

    --------------------------------------------------------------------------------
    -- Distance
    --------------------------------------------------------------------------------
    use({
        "chipsenkbeil/distant.nvim",
        config = function()
            require("distant").setup({
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ["*"] = require("distant.settings").chip_default(),
            })
        end,
    })

    --------------------------------------------------------------------------------
    -- WhichKey
    --------------------------------------------------------------------------------

    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    })

    --------------------------------------------------------------------------------
    -- nvim-transparent
    --------------------------------------------------------------------------------

    use("xiyaowong/nvim-transparent")
    require("transparent").setup({
        enable = true,
        extra_groups = {
            "all",
        },
        exclude = {}, -- table: groups you don't want to clear
    })

    --------------------------------------------------------------------------------
    -- Fidget
    --------------------------------------------------------------------------------

    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    })

    --------------------------------------------------------------------------------
    -- PHPactor
    --------------------------------------------------------------------------------

    use("phpactor/phpactor")

    --------------------------------------------------------------------------------
    -- TMUX Navigation
    --------------------------------------------------------------------------------

    use("christoomey/vim-tmux-navigator")

    --------------------------------------------------------------------------------
    -- Harpoon
    --------------------------------------------------------------------------------
    use("ThePrimeagen/harpoon")

    --------------------------------------------------------------------------------
    -- Markdown Preview
    --------------------------------------------------------------------------------
    use("davidgranstrom/nvim-markdown-preview")
end) -- packer.startup

--------------------------------------------------------------------------------
--  Autoload Plugins on Save                                                  --
--------------------------------------------------------------------------------

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])
