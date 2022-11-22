-- Protected Call
local status_ok, telescopeBuiltin = pcall(require, 'telescope.builtin')
if not status_ok then
  return
end

-- Setup

-- Key Bindings
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, {})
