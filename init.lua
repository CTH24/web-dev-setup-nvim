require('cth24.base')
require('cth24.highlights')
require('cth24.keymaps')
require('cth24.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
    require('cth24.macos')
end
if is_win then
    require('cth24.windows')
end

vim.cmd('colorscheme ayu')
vim.cmd [[ highlight! EndOfBuffer guibg=bg guifg=bg ]]
