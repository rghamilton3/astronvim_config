-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Add Plugins ==

  -- add Laravel plugins
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {

      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },
  {
    "oliverhkraft/nvim-pint",
    config = function()
      require("nvim-pint").setup {
        silent = true, -- No notifications
        exclude_folders = { "resources/views" }, -- Accepts comma separated array to exlude folders
      }
    end,
  },

  -- == Plugin Overrides ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██████╗  ██████╗ ██╗  ██╗    ███████╗██╗    ██╗",
        "██╔══██╗██╔════╝ ██║  ██║    ██╔════╝██║    ██║",
        "██████╔╝██║  ███╗███████║    ███████╗██║ █╗ ██║",
        "██╔══██╗██║   ██║██╔══██║    ╚════██║██║███╗██║",
        "██║  ██║╚██████╔╝██║  ██║    ███████║╚███╔███╔╝",
        "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝ ╚══╝╚══╝ ",
      }
      return opts
    end,
  },

  -- add neotest adapters
  {
    "nvim-neotest/neotest",
    dependencies = {
      "V13Axel/neotest-pest",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>Tp"] = {
                function() require("neotest").run.run "tests" end,
                desc = "Run all tests in project",
              },
              ["<Leader>Ts"] = {
                function() require("neotest").run.run { suite = true } end,
                desc = "Run full test suite",
              },
            },
          },
        },
      },
    },
    opts = function(_, opts)
      opts.log_level = vim.log.levels.DEBUG
      if not opts.adapters then opts.adapters = {} end

      vim.list_extend(opts.adapters, {
        require "neotest-pest",
      })
    end,
  },

  -- Set emmet fts
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        emmet_ls = {
          filetypes = {
            "astro",
            "blade",
            "css",
            "eruby",
            "html",
            "htmldjango",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
        },
      },
    },
  },
}
