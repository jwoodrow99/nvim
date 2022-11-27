-- Protected Call
local status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

-- Setup
local config = {
  ensure_installed = "all"
}

treesitter.setup(config)

-- Commands

-- Key Bindings
