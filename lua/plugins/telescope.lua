return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Adds file icons
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Search Text)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Find LSP Definitions" },
      { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
    },
  },
}
