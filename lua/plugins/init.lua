local plugins = {
  {
    "stevearc/conform.nvim",
    -- config = function()
      -- require "configs.conform"
    config = {
      lazy = true,
      event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
          formatters_by_ft = {
            astyle = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
          },
          formatters = {
            astyle = {
              command = "astyle",
              args = {
                "suffix=none",
                "style=allman",
                "indent=force-tab=8",
                "keep-one-line-blocks",
                "max-code-length=100",
                "break-after-logical",
                "break-return-type",
                "break-return-type-decl",
                "align-pointer=type",
                "indent-preproc-block",
                "lineend=linux",
                "break-blocks",
                "pad-comma",
                "pad-header",
                "pad-oper",
              },
            },
          },
          format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          },

      --[
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
          conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end, { desc = "Format file or range (in visual mode)" })
      --]
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  --[[
  -- Causes issues because code cannot be compiled
  {
    "neovim/nvim-lspconfig",
    config = function()
       require "nvchad.configs.lspconfig"
       require "configs.lspconfig"
    end,
  },
  --]]

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
      }
    }
  },

  --[[
  {
    --"mfulz/cscope.nvim",
    "gtags-cscope"
  },
  --]]
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
    opts = {
      -- USE EMPTY FOR DEFAULT OPTIONS
      -- DEFAULTS ARE LISTED BELOW
      -- maps related defaults
      disable_maps = false, -- "true" disables default keymaps
      skip_input_prompt = false, -- "true" doesn't ask for input
      prefix = "<leader>c", -- prefix to trigger maps

      -- cscope related defaults
      cscope = {
        -- location of cscope db file
        db_file = "./cscope.out",
        -- cscope executable
        exec = "cscope", -- "cscope" or "gtags-cscope"
        -- choose your fav picker
        picker = "quickfix", -- "telescope", "fzf-lua" or "quickfix"
        -- size of quickfix window
        qf_window_size = 5, -- any positive integer
        -- position of quickfix window
        qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
        -- "true" does not open picker for single result, just JUMP
        skip_picker_for_single_result = false, -- "false" or "true"
        -- these args are directly passed to "cscope -f <db_file> <args>"
        db_build_cmd_args = { "-bqkv" },
        -- statusline indicator, default is cscope executable
        statusline_indicator = nil,
        -- try to locate db_file in parent dir(s)
        project_rooter = {
          enable = false, -- "true" or "false"
          -- change cwd to where db_file is located
          change_cwd = false, -- "true" or "false"
        },
      }
      --require "configs.cscope_maps"
    },
  },
  {
    "nathom/filetype.nvim",
     config = function()
       require "configs.filetype"
    end
  },
}


return plugins
