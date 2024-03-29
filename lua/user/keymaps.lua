-- General keymaps

-- Set default leader for custom bindings
vim.g.mapleader = " "

-- Quit
vim.keymap.set("n", "<leader>qq", ":q<CR>") -- qq in normal mode will quit buffer
vim.keymap.set("n", "<leader>qa", ":qa<CR>") -- qa in normal mode will quit all buffers and exit

-- Split
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window verrtivally
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horisantally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- split window equal width
vim.keymap.set("n", "<leader>sq", ":close<CR>") -- close split window
vim.keymap.set("n", "<leader>h", "<C-w>h") -- Go to left window
vim.keymap.set("n", "<leader>j", "<C-w>j") -- Go to down window
vim.keymap.set("n", "<leader>k", "<C-w>k") -- Go to up window
vim.keymap.set("n", "<leader>l", "<C-w>l") -- Go to right window

-- Tab
vim.keymap.set("n", "<leader>to", ":tabnew<CR>:NvimTreeToggle<CR>") -- new tab
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab
