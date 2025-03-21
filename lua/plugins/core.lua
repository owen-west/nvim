return {
  -- Treesitter (Syntax Highlighting)
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "python", "lua", "bash" },
	highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- LSP (Language Server Protocol for Autocompletion)
  { 
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").clangd.setup({}) -- C++ LSP
    end
  },

  -- Autocompletion Plugin
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        })
      })
    end
  },

  -- Snippet Engine (Required for Completion)
  { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }
}

