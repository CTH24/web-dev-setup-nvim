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
        fd = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        diagnostics = { theme = "ivy" },
        git_files = { theme = "ivy" },
        git_status = { theme = "ivy" },
        git_commits = { theme = "ivy" },
        git_branches = { theme = "ivy" },
    },
})

telescope.load_extension("file_browser")

vim.keymap.set("n", ";f", function()
    builtin.find_files({
        no_ignore = false,
        hidden = false,
    })
end)
vim.keymap.set("n", ";r", function()
    builtin.live_grep()
end)
vim.keymap.set("n", "\\\\", function()
    builtin.buffers({
        initial_mode = "normal",
    })
end)
vim.keymap.set("n", ";t", function()
    builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
    builtin.resume()
end)
vim.keymap.set("n", ";e", function()
    builtin.diagnostics({
        initial_mode = "normal",
    })
end)

--map("n", "<leader>h", "<cmd>Telescope git_bcommits<cr>", opts)
vim.keymap.set("n", "<leader>h", function()
    builtin.git_bcommits({
        initial_mode = "normal",
        cwd = telescope_buffer_dir(),
    })
end)
