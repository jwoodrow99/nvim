-- lewis6991/gitsigns.nvim
-- =======================

-- Protected Call
local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

-- Setup
gitsigns.setup()

-- Commands & Options

-- Key Bindings
