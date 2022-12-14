-- https://github.com/mfussenegger/nvim-dap
-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
local dap = require("dap")
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", { text = "⊚", texthl = "TodoFgFIX", linehl = "", numhl = "" })
-- 加载调试器配置
local dap_config = {
    python = require("cth24.dap.python"),
    go = require("cth24.dap.go"),
    cpp = require("cth24.dap.cpp"),
    c = require("cth24.dap.cpp"),
    php = require("cth24.dap.php"),
}
-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
    dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end
-- 打断点
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
-- 开启调试或到下一个断点处
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {})
-- 单步进入执行（会进入函数内部，有回溯阶段）
map("n", "<F6>", "<cmd>lua require'dap'.step_into()<CR>", {})
-- 单步跳过执行（不进入函数内部，无回溯阶段）
map("n", "<F7>", "<cmd>lua require'dap'.step_over()<CR>", {})
-- 步出当前函数
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", {})
-- 重启调试
map("n", "<F3>", "<cmd>lua require'dap'.run_last()<CR>", {})
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
map(
    "n",
    "<F12>",
    "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    {}
)
