local status, _ = pcall(vim.cmd, "colorscheme ayu-dark")
if not status then
    vim.cmd("colorscheme default")
    print("Failed to load colorscheme!")
end
local colors = require("ayu.colors")
colors.generate() -- Pass `true` to enable mirage

require("ayu").setup({
    overrides = function()
        return { Comment = { fg = colors.comment } }
    end,
})
