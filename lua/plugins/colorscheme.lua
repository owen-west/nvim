return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load first
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

