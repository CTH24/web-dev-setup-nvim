-- wilder.rc.lua

local status, wilder = pcall(require, 'wilder')
if (not status) then return end

wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
    )
})

wilder.set_option('renderer', wilder.popupmenu_renderer(

    wilder.popupmenu_palette_theme({

        highlighter = wilder.lua_fzy_highlighter(),

        highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', {
                { a = 1 },
                { a = 1 },
                { foreground = '#ffb454' }
            }),
        },

        min_width = '75%',
        min_height = '50%',

        reverse = 0,

        left = {
            ' ',
            wilder.popupmenu_devicons()
        },

        right = {
            ' ',
            wilder.popupmenu_scrollbar()
        },

    })
))

vim.cmd [[set pumblend=0]]
