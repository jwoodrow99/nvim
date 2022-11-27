-- nvim-lualine/lualine.nvim
-- =========================

-- Protected Call
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

-- Setup
lualine.setup()

-- Commands

-- Key Bindings
