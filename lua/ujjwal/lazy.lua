local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
    'mg979/vim-visual-multi', branch = "master",
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  { 'neovim/nvim-lspconfig', },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup({
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        theme = 'monokai-pro',
      },
    },
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "auto",
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true,        -- Handle deprecated options automatically
  --       },
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         transparency = false,
  --       },
  --     })
  --
  --     vim.cmd([[colorscheme rose-pine]])
  --   end
  -- },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      require('monokai-pro').setup({})

      vim.cmd([[colorscheme monokai-pro]])
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({})
    end,
  },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    'gpanders/editorconfig.nvim'
  },
  { 'mfussenegger/nvim-jdtls' },
  {
    'lewis6991/gitsigns.nvim',
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  --   config = function()
  --     require("typescript-tools").setup {
  --       on_attach =
  --           function(client, bufnr)
  --             client.server_capabilities.documentFormattingProvider = false
  --             client.server_capabilities.documentRangeFormattingProvider = false
  --           end,
  --       settings = {
  --         jsx_close_tag = {
  --           enable = true,
  --           filetypes = { "javascriptreact", "typescriptreact" },
  --         }
  --       }
  --     }
  --   end
  -- },
  -- {
  --   'stevearc/conform.nvim',
  --   config = function()
  --     require("conform").setup({
  --       formatters_by_ft = {
  --         html = { { "prettierd" } },
  --         javascript = { { "prettierd" } },
  --         javascriptreact = { { "prettierd" } },
  --         markdown = { { "prettierd" } },
  --         typescript = { { "prettierd" } },
  --         typescriptreact = { { "prettierd" } },
  --         ["*"] = { "trim_whitespace" },
  --       },
  --       format_on_save = {
  --         timeout_ms = 500,
  --         lsp_fallback = true,
  --       },
  --       formatters = {
  --         prettierd = {
  --           condition = function()
  --             return vim.loop.fs_realpath(".prettierrc.js") ~= nil or vim.loop.fs_realpath(".prettierrc.mjs") ~= nil
  --           end,
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    'jose-elias-alvarez/null-ls.nvim'
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
