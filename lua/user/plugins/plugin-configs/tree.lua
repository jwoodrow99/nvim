-- nvim-tree/nvim-tree.lua
-- =======================

-- Protected Call
local status_ok, nvimTree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

-- Setup
local config = {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "l", action = "edit" },
        --{ key = "a", action = "expand_all" },
        --{ key = "c", action = "collapse_all" },
        { key = "<Enter>", action = "cd" },
      },
    },
  },
}

nvimTree.setup(config)

-- Commands
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd(':NvimTreeToggle')

-- Key Bindings
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { silent = true, noremap = true })
