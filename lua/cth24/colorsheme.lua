-- colorsheme.lua

local status, _ = pcall(vim.cmd, "colorscheme ayu-dark")
if not status then
    vim.cmd "colorscheme default"
    print("Failed to load colorscheme!")
end

