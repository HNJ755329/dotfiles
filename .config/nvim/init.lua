local opt = vim.opt;

opt.timeoutlen = 300;
opt.clipboard = "unnamedplus";
opt.number = false;
opt.relativenumber = false;
opt.signcolumn = "yes";
opt.cursorline = true;
opt.syntax = "on";
--Set 7 lines to the cursor - when moving vertically using j/k
opt.scrolloff = 7;
opt.smarttab = false;
opt.listchars = { space = '_', tab = '>~' };
--行末の1文字先までカーソルを移動できるように
opt.virtualedit = "onemore";
--括弧入力時の対応する括弧を表示
opt.showmatch = false;
--ステータスラインを常に表示
opt.wildmode = "longest:list,full";
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
vim.g.mapleader = 's'
vim.g.maplocalleader = 's'
local map = vim.keymap.set
-- map('n', '<space>bd', ':Bdelete<cr>');
map('n', '<C-h>', ':bprev<cr>');
map('n', '<C-l>', ':bnext<cr>');
-- map('c', 'qq', 'q!');
map('n', 's', '<Nop>');
-- map('n', 'S', '<Nop>');
-- map('n', 'r', '<Nop>');
-- map('n', 'Q', '<Nop>');
map('n', 'x', '"_x');
map('n', 'j', 'gj');
map('n', 'k', 'gk');
map('n', '<Esc><Esc>', '<cmd>nohlsearch<cr><esc>', { silent = true });
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
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'nvimdev/lspsaga.nvim' },
  { 'onsails/lspkind.nvim' },
  { 'folke/trouble.nvim' },
  -- snippet
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'saadparwaiz1/cmp_luasnip' },
  -- ui
  { 'nvim-treesitter/nvim-treesitter' },
  -- { "ThePrimeagen/harpoon",             branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

  { 'lewis6991/gitsigns.nvim' },
  -- { 'karb94/neoscroll.nvim' },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }, {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({})
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },}
  ,
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│", tab_char = "│", },
      scope = { enabled = true, show_start = true, show_end = true, },
      exclude = { filetypes = { "help", "terminal", "lazy", "mason", }, },
    }
  },
  { "chrisbra/csv.vim" },
  { 'stevearc/conform.nvim', opts = {}, },
})

-- https://lsp-zero.netlify.app/v3.x/autocomplete.html#use-enter-to-confirm-completion
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({ details = true })
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')

cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  }),
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- (Optional) Show source name in completion menu
  formatting = cmp_format,
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     mode = 'symbol', -- show only symbol annotations
  --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  --                    -- can also be a function to dynamically calculate max width such as
  --                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
  --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
  --     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
  --
  --     -- The function below will be called before any actual modifications from lspkind
  --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
  --     before = function (entry, vim_item)
  --       return vim_item
  --     end
  --   })
  -- },

  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  -- formatting = {
  --   -- changing the order of fields so the icon is the first
  --   fields = {'menu', 'abbr', 'kind'},
  --
  --   -- here is where the change happens
  --   format = function(entry, item)
  --     local menu_icon = {
  --       nvim_lsp = 'λ',
  --       luasnip = '⋗',
  --       buffer = 'Ω',
  --       path = '🖫',
  --       nvim_lua = 'Π',
  --     }
  --
  --     item.menu = menu_icon[entry.source.name]
  --     return item
  --   end,
  -- },
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   }),
--   matching = { disallow_symbol_nonprefix_matching = false }
-- })

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- to learn how to use jason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
-- require('mason-lspconfig').setup({
--   -- ensure_installed = {'tsserver', 'rust_analyzer','clangd'},
--   handlers = {
--     function(server_name)
--       require('lspconfig')[server_name].setup({})
--     end,
--   }
-- })
-- 意図しないlspの起動があるので消す

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  -- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
  capabilities = capabilities,
  cmd = { 'clangd-18', '--enable-config', '--background-index', '--clang-tidy', '--log=error' },
  -- cmd = {'clangd','--enable-config','--query-driver=**'},
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})

lspconfig.ts_ls.setup({
  filetypes = { "javascript", "typescript" }, -- HTML を追加
  init_options = {
    preferences = {
      includeCompletionsForModuleExports = true,
    },
  },
})

lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- "off", "basic", "strict" から選択
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      }
    }
  }
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = {"Cargo.toml", ".git"},
  single_file_support = true,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  },
})

-- if you are using neovim v0.9 or lower
-- this colorscheme is better than the default
vim.cmd.colorscheme('github_dark_default')
-- vim.cmd.colorscheme('habamax')
-- vim.cmd.colorscheme('retrobox')

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
  -- my preference mapping
  local opts = { buffer = bufnr };
  -- local map = vim.keymap.set;
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition({reuse_win = false})<cr>', opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  map('n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
  map('n', 'Q', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  map('n', 'S', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts);
  map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>');
  -- map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
end)


require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "rust",
    "typescript",
    "ruby",
    "python",
    "lua",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('gitsigns').setup {
  signs                        = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged                 = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable          = true,
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")
-- csv.vimの設定
vim.g.csv_delim_test = ',;|'     -- 区切り文字の自動判別
vim.g.csv_highlight_column = 'y' -- 現在のカラムをハイライト

-- ファイルタイプ別の設定
vim.api.nvim_create_augroup('csv_files', { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost' }, {
--   group = 'csv_files',
--   pattern = '*.csv',
--   callback = function()
--     -- ファイル読み込み時に整列（遅い場合はコメントアウト）
--     vim.cmd('%ArrangeColumn')
--   end,
-- })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = 'csv_files',
--   pattern = '*.csv',
--   callback = function()
--     -- 保存前に整列解除
--     vim.cmd('%unArrangeColumn')
--   end,
-- })
-- CSVファイル用のキーマッピング（任意）
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'csv',
  callback = function()
    -- 列の整列/解除
    vim.keymap.set('n', '<leader>ca', '%ArrangeColumn', { buffer = true, desc = 'CSV: Arrange columns' })
    vim.keymap.set('n', '<leader>cu', '%unArrangeColumn', { buffer = true, desc = 'CSV: Unarrange columns' })

    -- 列の削除（カーソル列を削除）
    vim.keymap.set('n', '<leader>cd', ':DeleteColumn<CR>', { buffer = true, desc = 'CSV: Delete column' })

    -- ヘッダー表示切り替え
    vim.keymap.set('n', '<leader>ch', ':HeaderToggle<CR>', { buffer = true, desc = 'CSV: Toggle header' })
  end,
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettier" },
  },
  format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
})
