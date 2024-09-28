--print("this is vim.opt");
local opt = vim.opt;

opt.timeoutlen = 300;
opt.clipboard = "unnamedplus";
opt.number = true;
opt.relativenumber = true;
opt.signcolumn = "yes";
opt.cursorline = true;
opt.syntax = "on";
--Set 7 lines to the cursor - when moving vertically using j/k
opt.so = 7;
opt.smarttab = true;
opt.listchars = { space = '_', tab = '>~' };
--行末の1文字先までカーソルを移動できるように
opt.virtualedit = "onemore";
--括弧入力時の対応する括弧を表示
opt.showmatch = true;
--ステータスラインを常に表示
opt.laststatus = 2;
--コマンドラインの補完
opt.wildmode = "list:longest";
--検索系
--検索文字列が小文字の場合は大文字小文字を区別なく検索する
opt.ignorecase = true;
--検索文字列に大文字が含まれている場合は区別して検索する
opt.smartcase = true;
--検索文字列入力時に順次対象文字列にヒットさせる
opt.incsearch = true;
--検索時に最後まで行ったら最初に戻る
opt.wrapscan = false;
--検索語をハイライト表示
opt.hlsearch = true;
--何も考えず~/.vimrcにこれを書くんだ！vim初心者によるvim初心者のためのvim入門
--https://qiita.com/morikooooo/items/9fd41bcd8d1ce9170301
opt.fenc = 'utf-8';
opt.backup = false;
opt.swapfile = false;
--編集中のファイルが変更されたら自動で読み直す
opt.autoread = true;
--バッファが編集中でもその他のファイルを開けるように
opt.hidden = true;
opt.showcmd = true;
--Tab文字を半角スペースにする
opt.expandtab = true;
--行頭以外のTab文字の表示幅（スペースいくつ分）
opt.tabstop = 2
--行頭でのTab文字の表示幅
opt.shiftwidth = 2
opt.laststatus = 3
opt.autoindent = true;
opt.smartindent = true;
opt.wrap = true;
opt.pumheight = 10;
--print("mapping set")
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local map = vim.keymap.set
map('n', 's', '<Nop>');
map('n', 'r', '<Nop>');
map('n', 'x', '"_x');
map('n', 'sn', 'gt');
map('n', 'sp', 'gT');
map('n','j','gj');
map('n','k','gk');
map('n', '<Esc><Esc>', '<cmd>nohlsearch<cr><esc>', { silent = true });
-- map('n','Y','y$');
-- default for neovim10.0
map('n', 'U', '<C-r>');
map('i', 'jk', '<Esc>');
--Emacs like keybinds
map({ 'c', 'i' }, '<C-c>', '<Esc>');
map({ 'c', 'i' }, '<C-a>', '<Home>');
map({ 'c', 'i' }, '<C-e>', '<End>');
map({ 'c', 'i' }, '<C-f>', '<Right>');
map({ 'c', 'i' }, '<C-b>', '<Left>');
map({ 'c', 'i' }, '<C-p>', '<Up>');
map({ 'c', 'i' }, '<C-n>', '<Down>');
map({ 'c', 'i' }, '<C-d>', '<Del>');
--print("setting finished")
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { "ThePrimeagen/harpoon",             branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

  { 'majutsushi/tagbar' }
})

-- https://lsp-zero.netlify.app/v3.x/autocomplete.html#use-enter-to-confirm-completion
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
})

-- if you are using neovim v0.9 or lower
-- this colorscheme is better than the default
vim.cmd.colorscheme('habamax')

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
  -- my preference mapping
  local opts = { buffer = bufnr };
  -- local map = vim.keymap.set;
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition({reuse_win = true})<cr>', opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts);
  map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>');
  -- map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
end)

-- to learn how to use jason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  -- ensure_installed = {'tsserver', 'rust_analyzer','clangd'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

let g:lsp_settings = { 'clangd': { 'cmd': ['clangd', '--enable-config'] } }

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
map('n', '<leader>l', '<cmd>TagbarToggle<cr>');
