-- windwp/nvim-autopairs
-- =====================

-- Protected Call
local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

-- Setup
autopairs.setup()

-- Commands & Options

-- Key Bindings
