local status = pcall(require, "lsp_signature")
if not status then
    print("lsp_signatur not found")
    return
end

local cfg = {} -- add you config here
require("lsp_signature").setup(cfg)
