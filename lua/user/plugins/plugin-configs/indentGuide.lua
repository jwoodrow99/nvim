-- lukas-reineke/indent-blankline.nvim
-- ===================================

-- Protected Call
local status_ok, indentBlankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

-- Setup
local config = {
  show_end_of_line = true,
  space_char_blankline = " ",
}

indentBlankline.setup(config)

-- Commands
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- Key Bindings
