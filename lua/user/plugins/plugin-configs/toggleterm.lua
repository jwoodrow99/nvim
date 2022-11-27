-- akinsho/toggleterm.nvim
-- =======================

-- Protected Call
local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

-- Setup

local config = {
  size = 10,
  open_mapping = [[<leader>tt]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = false,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
toggleterm.setup(config)

-- Commands & Options
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

-- Key Bindings
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>qq', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
