-- neovim/nvim-lspconfig
-- williamboman/mason.nvim
-- =======================

-- Protected Call
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, masonLspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

-- Setup

local masonConfig = {
  -- The directory in which to install packages.
  -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

  -- Where Mason should put its bin location in your PATH. Can be one of:
  -- - "prepend" (default, Mason's bin location is put first in PATH)
  -- - "append" (Mason's bin location is put at the end of PATH)
  -- - "skip" (doesn't modify PATH)
  ---@type '"prepend"' | '"append"' | '"skip"'
  PATH = "prepend",

  pip = {
    -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
    upgrade_pip = false,

    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with package installations.
  log_level = vim.log.levels.INFO,

  -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
  -- packages that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
  -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
  -- Builtin providers are:
  --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
  --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
  providers = {
    "mason.providers.registry-api",
  },

  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,

    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",

    icons = {
      -- The list icon to use for installed packages.
      package_installed = "◍",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "◍",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "◍",
    },

    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "c",
      -- Keymap to update all installed packages
      update_all_packages = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "C",
      -- Keymap to uninstall a package
      uninstall_package = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
      -- Keymap to apply language filter
      apply_language_filter = "<C-f>",
    },
  },
}

local masonLspconfigConfig = {
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = { "awk_ls", "als", "angularls", "ansiblels", "apex_ls", "arduino_language_server",
    "astro", "bashls", "beancount", "bicep", "bufls", "clangd", "csharp_ls", "omnisharp_mono", "omnisharp", "clangd",
    "cmake", "cssls", "cssmodules_ls", "clarity_lsp", "clojure_lsp", "codeqlls", "crystalline",
    "cucumber_language_server", "dagger", "denols", "dhall_lsp_server", "diagnosticls", "serve_d", "dockerls", "dotls",
    "efm", "eslint", "elixirls", "elmls", "ember", "emmet_ls", "erg_language_server", "fsautocomplete",
    "flux_lsp", "fortls", "glint", "golangci_lint_ls", "gopls", "gradle_ls", "grammarly", "graphql", "html",
    "hls", "hoon_ls", "jsonls", "jdtls", "quick_lint_js", "tsserver",
    "jsonnet_ls", "julials", "kotlin_language_server", "ltex", "texlab", "lelwel_ls", "lua_ls", "luau_lsp",
    "marksman", "prosemd_lsp", "prosemd_lsp", "zk", "mm0_ls", "nickel_ls", "rnix", "bsl_ls", "spectral",
    "opencl_ls", "intelephense", "phpactor", "psalm", "perlnavigator", "prismals", "puppet",
    "purescriptls", "jedi_language_server", "pyright", "pylsp", "r_language_server", "rescriptls",
    "reason_ls", "robotframework_ls", "rome", "ruby_ls", "solargraph", "rust_analyzer", "sqlls", "sqlls", "salt_ls",
    "theme_check", "solang", "solc", "solidity", "sorbet", "esbonio", "stylelint_lsp", "svelte",
    "svlangserver", "taplo", "tailwindcss", "terraformls", "tflint", "tsserver", "vimls", "visualforce_ls",
    "volar", "vuels", "vtsls", "wgsl_analyzer", "lemminx", "yamlls" },

  -- unconfigured LSP's: groovyls, asm_lsp, zls, foam_ls, vls, erlangls, haxe_language_server, ocamllsp, powershell_es, slint_lsp, verible, teal_ls, vala_ls, svls


  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
}

mason.setup(masonConfig)
masonLspconfig.setup(masonLspconfigConfig)


-- Atomatically handle the registration of all installed LSP
masonLspconfig.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function()
  --   require("rust-tools").setup {}
  -- end
}

-- Commands

-- Key Bindings
