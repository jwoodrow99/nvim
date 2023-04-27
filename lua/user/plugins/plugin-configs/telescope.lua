-- nvim-telescope/telescope.nvim
-- =============================

-- Protected Call
local status_ok, telescopeBuiltin = pcall(require, 'telescope.builtin')
local status_ok, telescopeActions = pcall(require, 'telescope.actions')
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

-- Setup

telescope.setup({
  defaults = {
      vimgrep_arguments = {
          "rg",
          -- "--color=never",
          -- "--no-heading",
          -- "--with-filename",
          -- "--line-number",
          -- "--column",
          -- "--smart-case",
          -- "--hidden"
      },
      file_ignore_patterns = {
        ".git/.*"
      },
      mappings = {
        n = {
          ["l"] = telescopeActions.select_default
        }
      }
  }
})

-- Key Bindings
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, {})
