local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)

  -- Base Plugins and dependencies
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "nvim-tree/nvim-web-devicons" } -- Common dev icons

  -- LSP Plugins
  use { "williamboman/mason.nvim" } -- Language server manager Plugin
  use { "williamboman/mason-lspconfig.nvim" } -- Add comptability layer between mason and nvim-lspconfig
  use { "neovim/nvim-lspconfig" } -- Nvim native LSP Plugin

  -- CMP plugins
  use { "hrsh7th/cmp-nvim-lsp" } -- Plugin
  use { "hrsh7th/cmp-buffer" } -- Plugin
  use { "hrsh7th/cmp-path" } -- Plugin
  use { "hrsh7th/cmp-cmdline" } -- Plugin
  use { "hrsh7th/nvim-cmp" } -- Plugin

  -- Snipet Plugins
  use { "L3MON4D3/LuaSnip" } -- Plugin
  use { "saadparwaiz1/cmp_luasnip" } -- Plugin
  use { "rafamadriz/friendly-snippets" } -- plugin

  -- TreeSitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Improved syntax highlighting

  -- Minor feature plugins
  use { "rafi/awesome-vim-colorschemes" } -- Colorscheme plugin
  use { "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" } -- File tree viewer
  use { "nvim-telescope/telescope.nvim" } -- Fuzzy Filder
  use { "lukas-reineke/indent-blankline.nvim" } -- Indent guides
  use { "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" } -- Buffer statusline
  use { "tpope/vim-commentary" } -- Comment motion
  use { "tpope/vim-surround" } -- Sourround motion
  use { "windwp/nvim-autopairs" } -- Auto generate character pairs
  use { "lewis6991/gitsigns.nvim" } -- Add git line status in gutter
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" } -- Compare git file difference
  use { "akinsho/toggleterm.nvim" } -- Adds advanced terminal to nvim

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
