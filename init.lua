-- init.lua

require('cth24.options')
require('cth24.colorsheme')

require('cth24.highlights')
require('cth24.packer-plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
    require('cth24.macos')
end
if is_win then
    require('cth24.windows')
end

require('cth24.keymaps')
