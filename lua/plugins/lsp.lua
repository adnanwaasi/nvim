return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
      diagnostics = {
        virtual_text = { spacing = 4, prefix = "●" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
          },
        },
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        pyright = {},
        ruff = {},
        ts_ls = {},
        eslint = {},
        clangd = {},
        gopls = {},
        rust_analyzer = {},
        bashls = {},
        jsonls = {},
        yamlls = {},
        html = {},
        cssls = {},
        tailwindcss = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "eslint",
        "gopls",
        "pyright",
        "ruff",
        "clangd",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "eslint_d",
        "shfmt",
        "shellcheck",
        "black",
        "ruff",
        "clang-format",
        "goimports",
        "gofumpt",
      },
    },
  },
}
