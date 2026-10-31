# nvim

My Neovim config, built on [LazyVim](https://github.com/LazyVim/LazyVim) with a Catppuccin Mocha theme, a broad set of LSP servers, blink.cmp completion and GitHub Copilot.

## Requirements

- Neovim **0.11.2+**
- `git`, `curl`, `unzip`, a C compiler (`gcc` or `clang`)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep), [`fd`](https://github.com/sharkdp/fd), [`fzf`](https://github.com/junegunn/fzf), [`lazygit`](https://github.com/jesseduffield/lazygit)
- [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter) (nvim-treesitter `main` builds parsers with it)
- A [Nerd Font](https://www.nerdfonts.com/) set in your terminal
- Runtimes Mason needs to install language servers and formatters:
  - **Node.js / npm** for TypeScript, ESLint, Pyright, Prettier, Tailwind, HTML/CSS/JSON/YAML, Bash LS and Copilot
  - **Python 3** (with `venv`) for Black and Ruff
  - **Go** for gopls, goimports and gofumpt

## Install

Back up any existing config first:

```sh
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone and start Neovim:

```sh
git clone https://github.com/adnanwaasi/nvim ~/.config/nvim
nvim
```

On first launch lazy.nvim installs every plugin at the versions pinned in `lazy-lock.json`, and Mason installs the language servers and tools. When that finishes:

1. Run `:Copilot auth` to sign in to GitHub Copilot.
2. Run `:checkhealth` to see anything still missing.

## Layout

```
init.lua                  entry point
lua/config/lazy.lua       bootstraps and sets up lazy.nvim
lua/config/options.lua    editor options
lua/config/keymaps.lua    extra keymaps
lua/config/autocmds.lua   extra autocommands
lua/plugins/lsp.lua       LSP servers, diagnostics, Mason tools
lua/plugins/completion.lua  blink.cmp + lsp_signature
lua/plugins/copilot.lua   copilot.vim + CopilotChat
lua/plugins/ui.lua        Catppuccin, lualine, noice, which-key, bufferline
```

## What's configured

### Options

Absolute line numbers (no relative numbers), cursorline, a global statusline, and new splits open below and to the right.

### Language servers

Installed and set up automatically: `lua_ls`, `pyright`, `ruff`, `ts_ls`, `eslint`, `clangd`, `gopls`, `rust_analyzer`, `bashls`, `jsonls`, `yamlls`, `html`, `cssls`, `tailwindcss`.

Formatters and linters installed through Mason: `stylua`, `prettier`, `eslint_d`, `shfmt`, `shellcheck`, `black`, `ruff`, `clang-format`, `goimports`, `gofumpt`.

### Completion

| Key | Action |
| --- | --- |
| `<CR>` / `<C-y>` | Accept the selected item |
| `<Tab>` / `<S-Tab>` | Next / previous item, or jump through a snippet |
| `<C-Space>` | Show completion or toggle documentation |

Documentation for the selected item shows automatically, and function signatures appear while you type arguments.

### Copilot

Suggestions are on for every filetype. `<Tab>` is left to the completion menu.

| Key (insert mode) | Action |
| --- | --- |
| `<C-j>` | Accept suggestion |
| `<C-l>` | Accept next word |
| `<C-k>` / `<C-n>` | Previous / next suggestion |

CopilotChat:

| Key | Action |
| --- | --- |
| `<leader>cc` | Open chat |
| `<leader>ce` | Explain code |
| `<leader>cr` | Review code |
| `<leader>cf` | Fix code |
| `<leader>co` | Optimize code |
| `<leader>cd` | Add documentation |
| `<leader>ct` | Generate tests |
| `<leader>cfd` | Fix diagnostics |
| `<leader>ccm` | Commit message for all changes |
| `<leader>ccs` | Commit message for staged changes |

### UI

Catppuccin Mocha with dimmed inactive windows, rounded borders on floats and menus, a lualine statusline that shows the relative file path, noice's command palette, and slanted bufferline tabs with LSP diagnostics.

## Updating

- `:Lazy sync` updates plugins and rewrites `lazy-lock.json`. Commit the lockfile so every machine gets the same versions.
- `:Mason` shows installed language servers and tools and lets you update them.

To pull in changes from the LazyVim starter template:

```sh
git remote add upstream https://github.com/LazyVim/starter.git  # once per clone
git fetch upstream
git merge upstream/main
```
