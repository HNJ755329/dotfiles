# dotfiles

shell scriptからAnsible での管理に移行。

```
# 実行する前に-check,-diffで実際の変更
make install-check
make install-diff
make install
# make installで apt install, cargo install, go installなどが走る.
make link-check
make link-diff
make link
# .config/ファイルにリンクを貼る.
```

以前使用していたものはarchive/に移動.

# my prefrence keyboard settings

## NeoVim

vim.g.leader = `s`
vim.g.localleader = `s`

| mode    | key          |                                                               | options           |
| ------- | ------------ | ------------------------------------------------------------- | ----------------- |
| `n`     | `s`          | `<Nop>`                                                       |
| `n`     | `r`          | `<Nop>`                                                       |
| `n`     | `x`          | `"_x`                                                         |
| `n`     | `<Esc><Esc>` | `<cmd>nohlsearch<cr><esc>`                                    | { silent = true } |
| `n`     | `U`          | `<C-r>`                                                       |
| `i`     | `jk`         | `<Esc>`                                                       |
| `c` `i` | `<C-c>`      | `<Esc>`                                                       |
| `c` `i` | `<C-a>`      | `<Home>`                                                      |
| `c` `i` | `<C-e>`      | `<End>`                                                       |
| `c` `i` | `<C-f>`      | `<Right>`                                                     |
| `c` `i` | `<C-b>`      | `<Left>`                                                      |
| `c` `i` | `<C-p>`      | `<Up>`                                                        |
| `c` `i` | `<C-n>`      | `<Down>`                                                      |
| `c` `i` | `<C-d>`      | `<Del>`                                                       |
| `n`     | `K`          | `<cmd>lua vim.lsp.buf.hover()<cr>`                            |
| `n`     | `gd`         | `<cmd>lua vim.lsp.buf.definition({reuse_win = true})<cr>`     |
| `n`     | `gD`         | `<cmd>lua vim.lsp.buf.declaration()<cr>`                      |
| `n`     | `gi`         | `<cmd>lua vim.lsp.buf.implementation()<cr>`                   |
| `n`     | `go`         | `<cmd>lua vim.lsp.buf.type_definition()<cr>`                  |
| `n`     | `gr`         | `<cmd>lua vim.lsp.buf.references()<cr>`                       |
| `n`     | `gs`         | `<cmd>lua vim.lsp.buf.signature_help()<cr>`                   |
| `n`     | `<leader>rn` | `<cmd>lua vim.lsp.buf.rename()<cr>`                           |
| `n`     | `<F4>`       | `<cmd>lua vim.lsp.buf.code_action()<cr>`                      |
| `n`     | `gl`         | `<cmd>lua vim.diagnostic.open_float()<cr>`                    |
| `n`     | `[d`         | `<cmd>lua vim.diagnostic.goto_prev()<cr>`                     |
| `n`     | `]d`         | `<cmd>lua vim.diagnostic.goto_next()<cr>`                     |
| `n`     | `<leader>f`  | `<cmd>lua vim.lsp.buf.format({async = true})<cr>`             |
| `n`     | `<leader>a`  | `function() harpoon:list():add() end`                         |
| `n`     | `<leader>e`  | `function() harpoon.ui:toggle_quick_menu(harpoon:list()) end` |
| `n`     | `<leader>l`  | `<cmd>TagbarToggle<cr>`                                       |

## GNU Emacs

| key         | functions        |
| ----------- | ---------------- |
| `C-c C-c p` | markdown-preview |

## tmux

## i3

# install applications
