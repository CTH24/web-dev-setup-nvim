-- copilot.lua

local status, copilot = pcall(require, "copilot")
if not status then
    return
end

require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        auto_refresh = true,
        debounce = 75,
        keymap = {
            accept = "<C-y>",
            next = "<M-]>",
            prev = "<M-[>",
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
