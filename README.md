# dotfiles

shell scriptからAnsible での管理に移行.
make install: apt install, cargo install, go installなどが走る.
make link: .config/ファイルにリンクを貼る.

```
$ sudo apt-get update && apt-get install -y make git sudo curl ansible
$ make install
$ make link
```

実行する前に-check,-diffで実際の変更を確認できる.

```
make install-check
make install-diff
make link-check
make link-diff
```

以前使用していたものはarchive/に移動.

# my prefrence keyboard settings

## NeoVim

vim.g.leader = `s`
vim.g.localleader = `s`

| mode    | key          |                                                           | options           |
| ------- | ------------ | --------------------------------------------------------- | ----------------- |
| `n`     | `s`          | `<Nop>`                                                   |
| `n`     | `x`          | `"_x`                                                     |
| `n`     | `<Esc><Esc>` | `<cmd>nohlsearch<cr><esc>`                                | { silent = true } |
| `n`     | `U`          | `<C-r>`                                                   |
| `i`     | `jk`         | `<Esc>`                                                   |
| `c` `i` | `<C-c>`      | `<Esc>`                                                   |
| `c` `i` | `<C-a>`      | `<Home>`                                                  |
| `c` `i` | `<C-e>`      | `<End>`                                                   |
| `c` `i` | `<C-f>`      | `<Right>`                                                 |
| `c` `i` | `<C-b>`      | `<Left>`                                                  |
| `c` `i` | `<C-p>`      | `<Up>`                                                    |
| `c` `i` | `<C-n>`      | `<Down>`                                                  |
| `c` `i` | `<C-d>`      | `<Del>`                                                   |
| `n`     | `K`          | `<cmd>lua vim.lsp.buf.hover()<cr>`                        |
| `n`     | `gd`         | `<cmd>lua vim.lsp.buf.definition({reuse_win = true})<cr>` |
| `n`     | `gD`         | `<cmd>lua vim.lsp.buf.declaration()<cr>`                  |
| `n`     | `gi`         | `<cmd>lua vim.lsp.buf.implementation()<cr>`               |
| `n`     | `go`         | `<cmd>lua vim.lsp.buf.type_definition()<cr>`              |
| `n`     | `gr`         | `<cmd>lua vim.lsp.buf.references()<cr>`                   |
| `n`     | `gs`         | `<cmd>lua vim.lsp.buf.signature_help()<cr>`               |
| `n`     | `<leader>rn` | `<cmd>lua vim.lsp.buf.rename()<cr>`                       |
| `n`     | `gl`         | `<cmd>lua vim.diagnostic.open_float()<cr>`                |
| `n`     | `[d`         | `<cmd>lua vim.diagnostic.goto_prev()<cr>`                 |
| `n`     | `]d`         | `<cmd>lua vim.diagnostic.goto_next()<cr>`                 |
| `n`     | `<leader>f`  | `<cmd>lua vim.lsp.buf.format({async = true})<cr>`         |
| `n`     | `<leader>l`  | `<cmd>TagbarToggle<cr>`                                   |

## GNU Emacs

Emacsは主に日本語入力で使用.
Doom Emacs による日本語入力を検討中.

| key         | functions        |
| ----------- | ---------------- |
| `C-c C-c p` | markdown-preview |
| `C-\`       | 日本語変換       |

## i3

一般的なWindows keyをSuperとして使用.
windows manager として普通のkey bindingsを設定.

Super+Return exec alacritty
Super+shift+q kill
Super+Escape exec systemctl suspend

Super+s layout stacking
Super+w layout tabbed
Super+e layout toggle split

Super+h focus left
Super+j focus down
Super+k focus up
Super+l focus right
