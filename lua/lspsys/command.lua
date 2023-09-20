local command = {}

local subcommands = {
  finder = function(args)
    require('lspsys.finder'):new(args)
  end,
  peek_definition = function()
    require('lspsys.definition'):peek_definition(1)
  end,
  goto_definition = function(args)
    require('lspsys.definition'):goto_definition(1, args)
  end,
  peek_type_definition = function()
    require('lspsys.definition'):peek_definition(2)
  end,
  goto_type_definition = function()
    require('lspsys.definition'):goto_definition(2)
  end,
  rename = function(args)
    require('lspsys.rename'):lsp_rename(args)
  end,
  project_replace = function(args)
    require('lspsys.rename.project'):new(args)
  end,
  hover_doc = function(args)
    require('lspsys.hover'):render_hover_doc(args)
  end,
  show_workspace_diagnostics = function(args)
    require('lspsys.diagnostic.show'):show_diagnostics({ workspace = true, args = args })
  end,
  show_line_diagnostics = function(args)
    require('lspsys.diagnostic.show'):show_diagnostics({ line = true, args = args })
  end,
  show_buf_diagnostics = function(args)
    require('lspsys.diagnostic.show'):show_diagnostics({ buffer = true, args = args })
  end,
  show_cursor_diagnostics = function(args)
    require('lspsys.diagnostic.show'):show_diagnostics({ cursor = true, args = args })
  end,
  diagnostic_jump_next = function()
    require('lspsys.diagnostic'):goto_next()
  end,
  diagnostic_jump_prev = function()
    require('lspsys.diagnostic'):goto_prev()
  end,
  code_action = function()
    require('lspsys.codeaction'):code_action()
  end,
  outline = function()
    require('lspsys.symbol'):outline()
  end,
  incoming_calls = function(args)
    require('lspsys.callhierarchy'):send_method(2, args)
  end,
  outgoing_calls = function(args)
    require('lspsys.callhierarchy'):send_method(3, args)
  end,
  term_toggle = function(args)
    require('lspsys.floaterm'):open_float_terminal(args)
  end,
  open_log = function()
    require('lspsys.logger'):open()
  end,
  winbar_toggle = function()
    require('lspsys.symbol.winbar').toggle()
  end,
}

function command.command_list()
  return vim.tbl_keys(subcommands)
end

function command.load_command(cmd, arg)
  subcommands[cmd](arg)
end

return command
