-- =========================================================================
-- 基本設定 (Options)
-- =========================================================================
local opt = vim.opt

opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.number = false
opt.relativenumber = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 7
opt.smarttab = false
opt.listchars = { space = "_", tab = ">~" }
opt.virtualedit = "onemore"
opt.showmatch = false
opt.wildmode = "longest:list,full"

-- 検索系
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = false
opt.hlsearch = true

-- エンコーディング・ファイル管理
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.autoread = true

-- インデント・表示
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.laststatus = 3
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.pumheight = 10

-- =========================================================================
-- キーマップ (Keymaps)
-- =========================================================================
vim.g.mapleader = "s"
vim.g.maplocalleader = "s"

local map = vim.keymap.set

map("n", "<C-h>", "<cmd>bprev<cr>")
map("n", "<C-l>", "<cmd>bnext<cr>")
map("n", "s", "<Nop>")
map("n", "x", '"_x')
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<Esc><Esc>", "<cmd>nohlsearch<cr><esc>", { silent = true })
map("n", "U", "<C-r>")
map("i", "jk", "<Esc>")

-- Emacsライクなキーバインド (コマンドライン・インサートモード)
map({ "c", "i" }, "<C-c>", "<Esc>")
map({ "c", "i" }, "<C-a>", "<Home>")
map({ "c", "i" }, "<C-e>", "<End>")
map({ "c", "i" }, "<C-f>", "<Right>")
map({ "c", "i" }, "<C-b>", "<Left>")
map({ "c", "i" }, "<C-p>", "<Up>")
map({ "c", "i" }, "<C-n>", "<Down>")
map({ "c", "i" }, "<C-d>", "<Del>")

-- =========================================================================
-- パッケージマネージャー (lazy.nvim) のブートストラップ
-- =========================================================================
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

-- =========================================================================
-- プラグイン設定 (Plugins)
-- =========================================================================
require("lazy").setup({
  -- LSP & 補完
  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "onsails/lspkind.nvim" },

  -- スニペット
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  { "saadparwaiz1/cmp_luasnip" },

  -- UI & ユーティリティ
  { "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Ensure you are tracking the new main branch
  build = ":TSUpdate",
  config = function()
    -- Initialize the modern module
    require("nvim-treesitter").setup()
  end
  },

  { "lewis6991/gitsigns.nvim" },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references" },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = true, show_start = true, show_end = true },
      exclude = { filetypes = { "help", "terminal", "lazy", "mason" } },
    },
  },
  { "chrisbra/csv.vim" },
  { "stevearc/conform.nvim", opts = {} },
})

-- =========================================================================
-- カラースキーム
-- =========================================================================
vim.cmd.colorscheme("github_dark_default")

-- =========================================================================
-- nvim-cmp 設定
-- =========================================================================
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    }),
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- =========================================================================
-- LSP 設定 (Mason & lspconfig)
-- =========================================================================
require("mason").setup({})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- vim.lsp.config('clangd',
--   capabilities = capabilities,
--   cmd = { "clangd", "--enable-config", "--background-index", "--clang-tidy", "--log=error" },
--   init_options = {
--     fallbackFlags = { "-std=c++17" },
--   },
-- })
--
-- vim.lsp.config('ts_ls',settings={
--   capabilities = capabilities,
--   filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
--   init_options = {
--     preferences = {
--       includeCompletionsForModuleExports = true,
--     },
--   },
-- })

vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly', -- Options: 'openFilesOnly' or 'workspace'
      },
    },
  },
}

-- Enable the configured Pyright instance
vim.lsp.enable('pyright')

-- Define the manual rust-analyzer configuration
vim.lsp.config['rust_analyzer'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  single_file_support = true,
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    }
  }
}

-- Enable the server configuration globally
vim.lsp.enable('rust_analyzer')

-- Neovim標準のLspAttachイベントを使ったキーマップ設定
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gd", function() vim.lsp.buf.definition({ reuse_win = false }) end, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "go", vim.lsp.buf.type_definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gs", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<F4>", vim.lsp.buf.code_action, opts)
    map("n", "gl", vim.diagnostic.open_float, opts)
    map("n", "ge", vim.diagnostic.setloclist, opts)
    map("n", "Q", vim.diagnostic.goto_prev, opts)
    map("n", "S", vim.diagnostic.goto_next, opts)
    map("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, opts)
  end,
})

-- =========================================================================
-- Treesitter 設定
-- =========================================================================
local ts = require("nvim-treesitter")
-- Call setup first
ts.setup()
ts.install({
    "c",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "rust",
    "typescript",
    "javascript",
    "ruby",
    "python",
    "lua",
})


-- =========================================================================
-- Gitsigns 設定
-- =========================================================================
require("gitsigns").setup({
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")
    local function gmap(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    gmap("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end)

    gmap("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end)

    gmap("n", "<leader>hs", gitsigns.stage_hunk)
    gmap("n", "<leader>hr", gitsigns.reset_hunk)
    gmap("n", "<leader>hS", gitsigns.stage_buffer)
    gmap("n", "<leader>hu", gitsigns.undo_stage_hunk)
    gmap("n", "<leader>hR", gitsigns.reset_buffer)
    gmap("n", "<leader>hp", gitsigns.preview_hunk)
    gmap("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)
    gmap("n", "<leader>tb", gitsigns.toggle_current_line_blame)
    gmap("n", "<leader>hd", gitsigns.diffthis)
  end,
})

-- =========================================================================
-- Telescope 設定
-- =========================================================================
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- =========================================================================
-- Aerial 設定
-- =========================================================================
require("aerial").setup({
  on_attach = function(bufnr)
    map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- =========================================================================
-- CSV 設定
-- =========================================================================
vim.g.csv_delim_test = ",;|"
vim.g.csv_highlight_column = "y"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "csv",
  callback = function()
    map("n", "<leader>ca", "%ArrangeColumn", { buffer = true, desc = "CSV: Arrange columns" })
    map("n", "<leader>cu", "%unArrangeColumn", { buffer = true, desc = "CSV: Unarrange columns" })
    map("n", "<leader>cd", ":DeleteColumn<CR>", { buffer = true, desc = "CSV: Delete column" })
    map("n", "<leader>ch", ":HeaderToggle<CR>", { buffer = true, desc = "CSV: Toggle header" })
  end,
})

-- =========================================================================
-- Conform (フォーマッタ) 設定
-- =========================================================================
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
