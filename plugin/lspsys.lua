if vim.g.lspsys_version then
    return
end

vim.g.lspsys_version = '0.1.0'

vim.api.nvim_create_user_command('Lspsys', function(args)
    require('lspsys.command').load_command(args.fargs[1], vim.list_slice(args.fargs, 2))
end, {
    range = true,
    nargs = '+',
    complete = function(arg)
        local list = require('lspsys.command').command_list()
        return vim.tbl_filter(function(s)
            return string.match(s, '^' .. arg)
        end, list)
    end,
})
