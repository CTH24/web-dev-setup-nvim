-- options.lua

vim.cmd("autocmd!")

--------------------------------------------------------------------------------
-- UI                                                                          -
--------------------------------------------------------------------------------

vim.opt.termguicolors = true
vim.cmd([[ autocmd VimResized * wincmd = ]])

--------------------------------------------------------------------------------
-- Line Numbers                                                                -
--------------------------------------------------------------------------------

vim.wo.number = true
vim.opt.relativenumber = true

--------------------------------------------------------------------------------
-- Encoding                                                                    -
--------------------------------------------------------------------------------

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 25
vim.opt.shell = "zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 0
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.mouse = "i"
vim.o.ch = 0
vim.opt.wrap = false
vim.cmd([[set guicursor=a:blinkon1]])
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Remember Cursor Position
vim.cmd([[
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]])

-- Highlight YANK
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
            hl = "IncSearch",
        })
    end,
})

-- Remove Tilde
vim.wo.fillchars = "eob: "
vim.api.nvim_command("set listchars=tab:▸\\ ,trail:·,nbsp:␣,extends:⟩,precedes:⟨,conceal:␣")
-- Transparent VertSplit
vim.api.nvim_command("highlight VertSplit guibg=NONE ctermbg=NONE")
vim.cmd([[ highlight! EndOfBuffer guibg=bg guifg=bg ]])

vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE]])
vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]])
vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┨",
    vertright = "┣",
    verthoriz = "╋",
})
-- AutoResize
