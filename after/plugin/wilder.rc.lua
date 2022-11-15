-- wilder.rc.lua

local status, wilder = pcall(require, "wilder")
if not status then
    return
end

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("use_python_remote_plugin", 0)

wilder.set_option("pipeline", {
    wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
    ),
})

wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlighter = wilder.basic_highlighter(),
        min_width = "100%", -- minimum height of the popupmenu, can also be a number
        min_height = "10%", -- to set a fixed height, set max_height to the same value
        max_height = "10%",
        reverse = 0, -- if 1, shows the candidates from bottom to top
        left = {
            " ",
            wilder.popupmenu_devicons(),
        },
        highlights = {
            accent = wilder.make_hl("WilderAccent", "Pmenu", {
                { a = 1 },
                { a = 1 },
                { foreground = "#ffb454" },
                { background = "none" },
            }),
        },
        right = {
            " ",
            wilder.popupmenu_scrollbar(),
        },
    }))
)

vim.cmd([[set pumblend=0]])
