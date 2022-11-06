local generator = function()
    local el_segments = {}
    local builtin = require("el.builtin")
    local extensions = require("el.extensions")

    table.insert(el_segments, extensions.mode)
    table.insert(el_segments, " ")

    table.insert(el_segments, "%M")
    table.insert(el_segments, " ")

    table.insert(el_segments, extensions.file_icon)
    table.insert(el_segments, " ")

    table.insert(el_segments, builtin.file_relative)
    table.insert(el_segments, " ")

    table.insert(el_segments, builtin.line_number)
    table.insert(el_segments, ":")

    table.insert(el_segments, builtin.column)
    table.insert(el_segments, " ")

    -- show branch only wenn in git repo
    if vim.g.loaded_fugitive == 1 and vim.fn.FugitiveHead() ~= "" then
        table.insert(el_segments, extensions.git_icon)
        table.insert(el_segments, " ")
        table.insert(el_segments, extensions.git_branch)
        table.insert(el_segments, " ")
        table.insert(el_segments, extensions.git_changes)
        table.insert(el_segments, " ")
    end

    return el_segments
end
require("el").setup({ generator = generator })

vim.cmd([[highlight StatusLine guibg=#3a3a3a]])
