return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      completion = {
        menu = { border = "rounded" },
        documentation = {
          -- Show the selected completion item's LSP documentation automatically.
          auto_show = true,
          window = { border = "rounded" },
        },
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      handler_opts = { border = "rounded" },
    },
  },
}
