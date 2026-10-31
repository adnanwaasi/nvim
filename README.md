# nvim

My Neovim config, built on [LazyVim](https://github.com/LazyVim/LazyVim) with a Catppuccin Mocha theme, a broad set of LSP servers, blink.cmp completion and GitHub Copilot.

## Requirements

- Neovim **0.11.2+**
- `git`, `curl`, `unzip`, a C compiler (`gcc` or `clang`)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep), [`fd`](https://github.com/sharkdp/fd), [`fzf`](https://github.com/junegunn/fzf), [`lazygit`](https://github.com/jesseduffield/lazygit)
- [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter) (nvim-treesitter `main` builds parsers with it)
- A [Nerd Font](https://www.nerdfonts.com/) set in your terminal
- Runtimes Mason needs to install language servers and formatters:
  - **Node.js / npm** for TypeScript, ESLint, Pyright, Prettier, Tailwind, HTML/CSS/JSON/YAML and Bash LS
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

On first launch lazy.nvim installs every plugin at the versions pinned in `lazy-lock.json`, Mason installs the language servers and tools, and copilot.lua downloads the Copilot language server (around 100 MB, so give it a few minutes). When that finishes:

1. Run `:Copilot auth` to sign in to GitHub Copilot.
2. Run `:checkhealth` to see anything still missing.

## Layout

```
init.lua                  entry point
lazyvim.json              enabled LazyVim extras (Copilot and the extensions below)
lua/config/lazy.lua       bootstraps and sets up lazy.nvim
lua/config/options.lua    editor options
lua/config/keymaps.lua    extra keymaps
lua/config/autocmds.lua   extra autocommands
lua/plugins/lsp.lua       LSP servers, diagnostics, Mason tools
lua/plugins/completion.lua  blink.cmp + lsp_signature
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

Uses LazyVim's `ai.copilot` and `ai.copilot-chat` extras. Copilot suggestions show up in the completion menu next to LSP results, so you accept them with `<CR>` like any other item.

CopilotChat lives under `<leader>a`:

| Key | Action |
| --- | --- |
| `<leader>aa` | Toggle chat (works on a visual selection too) |
| `<leader>aq` | Quick one-off question |
| `<leader>ap` | Prompt picker: Explain, Review, Fix, Optimize, Docs, Tests, Commit |
| `<leader>ax` | Clear chat |
| `<C-s>` | Send the prompt (inside the chat window) |

If you'd rather see suggestions as inline ghost text, add `vim.g.ai_cmp = false` to `lua/config/options.lua`.

### Extensions

Extra plugins enabled from LazyVim's extras. Toggle any of them from `:LazyExtras`.

| Extension | What it does | Keys |
| --- | --- | --- |
| mini.surround | Add, change and delete surrounding quotes, brackets and tags | `gsa` add, `gsd` delete, `gsr` replace |
| yanky.nvim | Yank history and smarter pasting | `<leader>p` history, `[y` / `]y` cycle after a paste |
| dial.nvim | Increment and decrement numbers, booleans, dates, `&&`/`\|\|` and more | `<C-a>` / `<C-x>` |
| inc-rename.nvim | LSP rename with a live preview of every change | `<leader>cr` |
| mini.files | Browse and edit the file tree as a buffer | `<leader>fm` (current file), `<leader>fM` (cwd) |
| smear-cursor.nvim | Animated cursor trail when the cursor jumps | |
| nvim-treesitter-context | Pins the current function or class header to the top of the window | `<leader>ut` toggle |
| mini.hipatterns | Colours hex codes and Tailwind classes inline | |

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
