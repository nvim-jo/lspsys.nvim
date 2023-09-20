local api = vim.api
local kind = require('lspsys.lspkind').kind

local function hi_define()
  return {
    -- general
    SysTitle = { link = 'Title' },
    SysBorder = { link = 'FloatBorder' },
    SysNormal = { link = 'NormalFloat' },
    SysToggle = { link = 'Comment' },
    SysBeacon = { bg = '#c43963' },
    SysVirtLine = { fg = '#444a4d' },
    SysSpinnerTitle = { link = 'Statement' },
    SysSpinner = { link = 'Statement' },
    SysText = { link = 'Comment' },
    SysSelect = { link = 'String' },
    SysSearch = { link = 'Search' },
    SysFinderFname = { link = 'Function' },
    SysDetail = { link = 'Comment' },
    SysInCurrent = { link = 'KeyWord' },
    SysCount = { bg = 'gray', fg = 'white', bold = true },

    -- code action
    ActionFix = { link = 'Keyword' },
    ActionPreviewNormal = { link = 'SysNormal' },
    ActionPreviewBorder = { link = 'SysBorder' },
    ActionPreviewTitle = { link = 'Title' },
    CodeActionText = { link = '@variable' },
    CodeActionNumber = { link = 'DiffAdd' },
    -- hover
    HoverNormal = { link = 'SysNormal' },
    HoverBorder = { link = 'SysBorder' },
    -- rename
    RenameBorder = { link = 'SysBorder' },
    RenameNormal = { link = 'Statement' },
    RenameMatch = { link = 'Search' },
    -- diagnostic
    DiagnosticBorder = { link = 'SysBorder' },
    DiagnosticNormal = { link = 'SysNormal' },
    DiagnosticText = {},
    DiagnosticShowNormal = { link = 'SysNormal' },
    DiagnosticShowBorder = { link = '@property' },
    -- lightbulb
    SysLightBulb = { link = 'DiagnosticSignHint' },
    -- Float term
    TerminalBorder = { link = 'SysBorder' },
    TerminalNormal = { link = 'SysNormal' },
    -- Implement
    SysImpIcon = { link = 'PreProc' },
    --Winbar
    SysWinbarSep = { link = 'Operator' },
    SysFileName = { link = 'Comment' },
    SysFolderName = { link = 'Comment' },
  }
end

local function init_highlight()
  for group, conf in pairs(hi_define()) do
    api.nvim_set_hl(0, group, vim.tbl_extend('keep', conf, { default = true }))
  end

  for _, item in pairs(kind) do
    api.nvim_set_hl(0, 'Sys' .. item[1], { link = item[3], default = true })
  end
end

return {
  init_highlight = init_highlight,
}
