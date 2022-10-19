-- manson.rc.lua

local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

mason.setup()

mason_lspconfig.setup({

    ensure_installed = {
        "ansiblels",
        "bashls",
        "cssls",
        "clangd",
        "dockerls",
        "html",
        "jsonls",
        "jdtls",
        "tsserver",
        "sumneko_lua",
        "marksman",
        "phpactor",
        "pyright",
        "ruby_ls",
        "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "volar",
        "lemminx",
        "yamlls",
    },
})

mason_null_ls.setup({

    -- list of formatters & linters for mason to install
    ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
    },

    -- auto-install configured servers (with lspconfig)
    automatic_installation = true,
})
