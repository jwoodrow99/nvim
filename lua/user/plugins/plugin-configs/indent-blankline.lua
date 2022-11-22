-- Protected Call
local status_ok, indentBlankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

-- Setup
local config = {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}

indentBlankline.setup(config)

-- Commands
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- Key Bindings
