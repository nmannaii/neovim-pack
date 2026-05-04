# nvim config

> Neovim 0.12+ · `vim.pack` · Catppuccin · Space leader

Personal Neovim configuration targeting **.NET / C#** and **Angular / TypeScript** development, with Claude Code integration and a full debugging setup.

---

## Requirements

- Neovim **0.12+** (uses built-in `vim.pack` — no lazy.nvim)
- `git`, `node`, `npm`
- A [Nerd Font](https://www.nerdfonts.com/) in your terminal
- `tmux` (lazygit popup + DAP terminal)
- `lazygit`

---

## Structure

```
~/.config/nvim/
├── init.lua                  # Pack declarations + module loading
└── lua/
    ├── config/
    │   ├── options.lua       # Editor options
    │   ├── keymaps.lua       # Global keymaps
    │   ├── lsp.lua           # LSP config (vim.lsp API 0.11+)
    │   ├── ui.lua            # Colorscheme + UI tweaks
    │   ├── hooks.lua         # Autocommands
    │   └── notes.lua         # Custom notes module
    └── plugins/              # One file per plugin
```

---

## Plugins

### Core UI
| Plugin | Role |
|---|---|
| catppuccin/nvim | Colorscheme (`catppuccin-nvim` variant) |
| akinsho/bufferline.nvim | Buffer tabs |
| nvim-lualine/lualine.nvim | Statusline |
| folke/noice.nvim | Command/message UI overhaul |
| folke/snacks.nvim | Terminal, buffer utilities |
| nvim-neo-tree/neo-tree.nvim | File explorer |
| nvimdev/dashboard-nvim | Start screen |
| nvim-mini/mini.icons | Icon set |

### LSP & Completion
| Plugin | Role |
|---|---|
| neovim/nvim-lspconfig | LSP configurations |
| mason-org/mason.nvim | LSP/tool installer |
| j-hui/fidget.nvim | LSP progress UI |
| hrsh7th/nvim-cmp | Completion engine |
| hrsh7th/cmp-nvim-lsp | LSP source |
| hrsh7th/cmp-buffer | Buffer source |
| hrsh7th/cmp-path | Path source |

**Active language servers:** `lua_ls` · `tsgo` · `eslint` · `jsonls` · `cssls` · `angularls` · `protols`

### Telescope
| Plugin | Role |
|---|---|
| nvim-telescope/telescope.nvim | Fuzzy finder (ivy theme) |
| telescope-fzf-native.nvim | Native FZF sorter |
| telescope-ui-select.nvim | `vim.ui.select` override |

### Debugging (DAP)
| Plugin | Role |
|---|---|
| mfussenegger/nvim-dap | Debug Adapter Protocol core |
| igorlfs/nvim-dap-view | Debug UI with winbar sections |
| theHamsta/nvim-dap-virtual-text | Inline variable display |

.NET debugging uses **vsdbg** (`coreclr` adapter) launched in a tmux window. Launch configs read from `.vscode/nvim-launch.json`.

### Git
| Plugin | Role |
|---|---|
| lewis6991/gitsigns.nvim | Hunk signs + blame |
| sindrets/diffview.nvim | Side-by-side diffs |
| ThePrimeagen/git-worktree.nvim | Worktree management |
| lazygit | Full TUI via `<leader>gg` (tmux popup) |

### Formatting & Linting
| Plugin | Role |
|---|---|
| stevearc/conform.nvim | Formatter runner |
| mfussenegger/nvim-lint | Linter runner |

**Formatters:** `stylua` (Lua) · `js-beautify` with Angular templating (HTML/Angular) · LSP fallback (C#)

### Editing
| Plugin | Role |
|---|---|
| windwp/nvim-autopairs | Auto-close brackets |
| windwp/nvim-ts-autotag | Auto-close HTML/JSX tags |
| kylechui/nvim-surround | Surround motions |
| max397574/better-escape.nvim | Escape from insert mode |
| nvim-treesitter/nvim-treesitter | Syntax / folds |

### AI
| Plugin | Role |
|---|---|
| coder/claudecode.nvim | Claude Code integration |

### Productivity
| Plugin | Role |
|---|---|
| stevearc/overseer.nvim | Task runner |
| folke/trouble.nvim | Diagnostics list |
| folke/persistence.nvim | Session save/restore |
| tiagovla/scope.nvim | Tab-scoped buffers |
| folke/which-key.nvim | Keymap hints |
| ahmedkhalf/project.nvim | Project detection |
| MeanderingProgrammer/render-markdown.nvim | In-buffer markdown rendering |
| iamcco/markdown-preview.nvim | Browser preview |
| mistricky/codesnap.nvim | Code screenshots |
| christoomey/vim-tmux-navigator | Seamless tmux pane navigation |

---

## Keymaps

**Leader:** `Space`

### Navigation
| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Window / tmux pane navigation |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `[b` / `]b` | Previous / next buffer |
| `<leader>-` | Split below |
| `<leader>\|` | Split right |
| `<C-↑/↓/←/→>` | Resize window |

### Files & Search
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>/` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>gw` | Grep word under cursor |

### LSP (on attach)
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cd` | Line diagnostics |
| `[d` / `]d` | Prev / next diagnostic |

### Git
| Key | Action |
|---|---|
| `<leader>gg` | Open lazygit (tmux popup) |
| `]h` / `[h` | Next / prev hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gbl` | Blame line |
| `<leader>gB` | Toggle line blame |
| `<leader>gD` | Diff this |

### Debugging
| Key | Action |
|---|---|
| `<F5>` | Continue / run |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<S-F11>` | Step out |
| `<C-F10>` | Run to cursor |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>du` | Toggle DAP view |
| `<leader>dt` | Terminate session |

### AI (Claude Code)
| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume session |
| `<leader>aC` | Continue session |
| `<leader>ab` | Add current buffer |
| `<leader>as` | Send selection (visual) |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

### Editing
| Key | Action |
|---|---|
| `<C-s>` | Save |
| `<leader>cf` | Format file / selection |
| `<A-j/k>` | Move line down / up |
| `<leader>y` | Yank to system clipboard |
| `<leader>p` | Paste without yanking (visual) |
| `<leader>qq` | Quit all |

### Buffers
| Key | Action |
|---|---|
| `<leader>bd` | Delete buffer (snacks) |
| `<leader>bo` | Delete other buffers |
| `<leader>bb` | Switch to alternate buffer |

---

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/nvim-config ~/.config/nvim
nvim
```

`vim.pack` fetches all plugins on first launch. Mason handles LSP servers — run `:Mason` to install them.
