-- keymap.lua

--------------------------------------------------------------------------------
--  Prepare for keymaps mapping                                                -
--------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
--  Leader KEY
--------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<Space>", "<Nop>", opts)

--------------------------------------------------------------------------------
-- No Highlight                                                                -
--------------------------------------------------------------------------------

map("n", "<Leader>c", ":noh<CR>", opts)

--------------------------------------------------------------------------------
-- No yank with x                                                              -
--------------------------------------------------------------------------------

map("n", "x", "\"_x", opts)

--------------------------------------------------------------------------------
-- Yank entire File
--------------------------------------------------------------------------------

map("n", "YY", "gg<S-v>Gy", opts)

--------------------------------------------------------------------------------
-- Increase and Deincrease Numbers                                             -
--------------------------------------------------------------------------------

map("n", "<leader>+", "<C-a>", opts)
map("n", "<leader>-", "<C-x>", opts)

--------------------------------------------------------------------------------
--  Better <C-c>
--------------------------------------------------------------------------------

map("i", "<C-c>", "<ESC>", opts)
map("i", "jj", "<ESC><cmd>lua vim.lsp.buf.format { async = true}<cr>", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)

--------------------------------------------------------------------------------
--  Harpoon
--------------------------------------------------------------------------------

map("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
map("n", "<leader>j", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", "<leader>k", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", "<leader>l", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", "<leader>;", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

--------------------------------------------------------------------------------
--  Telescope
--------------------------------------------------------------------------------
--

-- Navigation to File
map("n", "<leader><leader>", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)
map("n", "<leader>p", "<cmd>Telescope fd<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

-- Naviagation in File
map("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
map("n", "<leader>gg", "<cmd>Neogit<CR>", opts)
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
map("n", "<leader>gl", "<cmd>Telescope git_bcommits<cr>", opts)
map("n", "<leader>gf", "<cmd>G fetch<cr>", opts)
map("n", "<leader>ga", "<cmd>G add .<cr>", opts)
map("n", "<leader>gc", "<cmd>G commit<cr>", opts)
map("n", "<leader>gwip", "<cmd>!git add . && git commit -m'wip' && git push<CR>", opts)
map("n", "<leader>gcp", "<cmd>!git add . && git commit -m'" .. os.date("%Y-%m-%d") .. "' && git push<CR>", opts)
map("n", "<leader>gp", "<cmd>G pull<cr>", opts)
map("n", "<leader>gP", "<cmd>G push<cr>", opts)

--------------------------------------------------------------------------------
--  NvimTree                                                               -
--------------------------------------------------------------------------------

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--------------------------------------------------------------------------------
--  Format Code                                                                -
--------------------------------------------------------------------------------

map("n", "<leader>=", "<cmd>lua vim.lsp.buf.format { async = true}<cr>", opts)

--------------------------------------------------------------------------------
--  GitHub Toogle AutoSuggestion                                               -
--------------------------------------------------------------------------------

map("n", "<leader>c", ":Copilot suggestion toggle_auto_trigger<CR>", opts)

--------------------------------------------------------------------------------
--  Workflow Development                                                       -
--------------------------------------------------------------------------------

map("n", "<leader>/", "<cmd>vsp TODO.md<cr>", opts)
map("n", "<leader>db", ":!/bin/bash ./build<CR>", opts)
map("n", "<leader>dr", ":!/bin/bash ./start<CR>", opts)
map("n", "<leader>dl", ":!/bin/bash ./logs<CR>", opts)
map("n", "<leader>dt", ":!/bin/bash ./terminal<CR>", opts)

--------------------------------------------------------------------------------
--  man Pages (rtfm)                                                           -
--------------------------------------------------------------------------------

vim.keymap.set("n", "<C-w>o", "<cmd>ZenMode<cr>", { silent = true })
