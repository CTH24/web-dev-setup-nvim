-- telescope.rc.lua

local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({

    defaults = {
        theme = "ivy",
        color_devicons = true,

        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
    },

    extensions = {
        file_browser = {
            theme = "ivy",
            height = 40,
            initial_mode = "normal",
            previewer = false,
            hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {
                    ["n"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd("startinsert")
                    end,
                },
            },
        },
    },

    pickers = {
        git_files = { theme = "ivy" },
        fd = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        oldfiles = { theme = "ivy", only_cwd = true },
        help_tags = { theme = "ivy" },
        lsp_document_symbols = { theme = "ivy" },
        diagnostics = { theme = "ivy", initial_mode = "normal" },
        git_status = { theme = "ivy", initial_mode = "normal" },
        git_commits = { theme = "ivy", initial_mode = "normal" },
        git_bcommits = { theme = "ivy", initial_mode = "normal" },
        git_branches = { theme = "ivy", initial_mode = "normal" },
    },
})

telescope.load_extension("file_browser")

vim.keymap.set("n", ";t", function()
    builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
    builtin.resume()
end)
vim.keymap.set("n", ";d", function()
    builtin.diagnostics({
        initial_mode = "normal",
    })
end)

vim.keymap.set("n", "<leader>c", function()
    builtin.git_status({
        initial_mode = "normal",
    })
end)

--map("n", "<leader>h", "<cmd>Telescope git_bcommits<cr>", opts)
--vim.keymap.set("n", "<leader>h", function()
--    builtin.git_bcommits({
--        initial_mode = "normal",
--        cwd = telescope_buffer_dir(),
--    })
--end)
