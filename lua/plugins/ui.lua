return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      dim_inactive = { enabled = true, percentage = 0.18 },
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        mason = true,
        native_lsp = { enabled = true },
        noice = true,
        notify = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          FloatBorder = { fg = colors.mauve, bg = colors.mantle },
          NormalFloat = { bg = colors.mantle },
          Pmenu = { bg = colors.mantle },
          CursorLine = { bg = colors.surface0 },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      })
      opts.sections = vim.tbl_deep_extend("force", opts.sections or {}, {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
        lualine_x = { "diagnostics", "diff", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      })
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = { border = { style = "rounded" } },
        popupmenu = { border = { style = "rounded" } },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      win = { border = "rounded" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "neo-tree", text = "Explorer", text_align = "center", separator = true },
        },
      },
    },
  },
}
