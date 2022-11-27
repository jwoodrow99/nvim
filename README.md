# NeoVim Configuration

This document contains all of the information for my personal Nvim configuration. This is a personal configuration and may include breaking changes in the future as my config is always changing.

## Overview

I decided to switch over to a custom Nvim configuration as the vim motions allowed me to speed up my workflow and the fact that VSCode was becoming slow for me. I also tried several other "Vim Builds" and was not entirely satisfied with them. The goal of this configuration is to offer similar functionality to that found in VSCode but far more performant. I will be using Nvim because it offers lua as the configuration language, is multi threaded and Nvim has additional features that some of the plugins depend on to run.

### Major Functionality included in this config

1. LSP and CMP
2. File tree viewer
3. Fuzzy Finder
4. Git Support

## Basic config

The configuration for Nvim lives in the following directory by default ```~/.config/nvim``` with the configuration entry file called ```init.lua``` or ```init.vim``` if using VimScript.

The key to our Nvim configuration is the ability to add open source plugins to extend the functionality of the default Nvim. This will be done with the use of the [Packer](https://github.com/wbthomason/packer.nvim) package manager. Our configuration will automatically install all dependencies, plugins, LSPs and packer itself on first startup.

### LSP and CMP

### File tree viewer

### Fuzzy Finder

### Git Support

### Other

I have included other plugins in this configuration, but many are self explanatory and require little to no configuration, so I have decided not to document them. I have included a full list of used plugins and their purpose at the bottom of the document for reference as well as in the configuration itself.

## Apply & Remove Config

To apply the configuration you gimply need to clone the contents of this repository into your Nvim config directory. This can easily be done by simply cloning this repo to replace the existing config directory. This will allow you to apply new changes by simply running git pull. Once the configuration is in place all dependencies will be installed and configured automatically on next open of Nvim.

**Note:** On first startup you may run into some errors as the LSP's automatically install. Most LSPs require the corresponding langues runtime or compiler to be installed externally and sometimes require unique configuration. The easy fix is to only install the LSPs for the languages you actually develop in, as all the tooling will be on your system.

``` bash
rm -rf ~/.config/nvim                           # Remove all previous installed configurations (LSPs ext...)
cd ~/.config                                    # Enter config directory where our config will live
git clone git@github.com:jwoodrow99/nvim.git    # Clone the config repository to replace existing Nvim config
nvim ./nvim                                     # Open Nvim in the cloned repository to start install and view configuration
```

To remove all traces of this configuration we will have to delete the configuration directory as well as the path to the installed dependencies the Packer and Mason have installed for us. You should note that just deleting the Nvim config directory will revert the behavior of Nvim back to default but all the installed dependencies will still be on the system. After deleting Nvim will rebuild the directories at next startup, with default config.

``` bash
rm -rf ~/.config/nvim         # Remove Nvim config
rm -rf ~/.local/share/nvim    # Remove Nvim config installed dependencies
```

## Used Plugins

All repo's are located on GitHub and annotated in this document as ```<user_name>/<repo>```.

| Repo | Use |
|:-|:-|
| wbthomason/packer.nvim | Package manager for plugins |
| nvim-lua/plenary.nvim | Additional useful functions |
| nvim-tree/nvim-web-devicons | Icon pack used by plugins |
| williamboman/mason.nvim | Package manager for LSPs |
| williamboman/mason-lspconfig.nvim | Automatically install LSP's via mason and register them with nvim-lspconfig |
| neovim/nvim-lspconfig | Nvim native LSP support |
| hrsh7th/cmp-nvim-lsp | Code completion integration tools |
| hrsh7th/cmp-buffer | Code completion integration tools |
| hrsh7th/cmp-path | Code completion integration tools |
| hrsh7th/cmp-cmdline | Code completion integration tools |
| hrsh7th/nvim-cmp | Code completion integration tools |
| L3MON4D3/LuaSnip | Code snippet engine |
| saadparwaiz1/cmp_luasnip | Code snippet integration with CMP |
| rafamadriz/friendly-snippets | Collection of code snippets |
| nvim-treesitter/nvim-treesitter | Better syntax highlighting |
| rafi/awesome-vim-colorschemes | Easily switch between popular color schemes |
| nvim-tree/nvim-tree.lua | Tree files explorer |
| nvim-telescope/telescope.nvim | Fuzzy finder |
| lukas-reineke/indent-blankline.nvim | Indent guides |
| nvim-lualine/lualine.nvim | Improves status bar |
| tpope/vim-commentary | Comment shortcuts |
| tpope/vim-surround | Surround shortcuts |
| windwp/nvim-autopairs | Automatically create paired characters |
| lewis6991/gitsigns.nvim | Add git indications to gutter |
| sindrets/diffview.nvim | Show git diff in file |
| akinsho/toggleterm.nvim | Integrated terminal |
