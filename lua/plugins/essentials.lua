return {
  -- 1. File Explorer Sidebar (nvim-tree)
  -- Allows you to visually browse your Laravel directories (app, config, resources, etc.)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer Sidebar" },
    },
    config = function()
      require("nvim-tree").setup({
        view = { width = 35 },
        renderer = { group_empty = true },
        filters = { dotfiles = false }, -- Set to true if you want to hide .env or .git files
      })
    end,
  },

  -- 2. Autopairs (nvim-autopairs)
  -- Automatically closes quotes "", brackets [], parentheses (), and PHP arrays
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
      -- Connect autopairs with your autocompletion menu (nvim-cmp)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- 3. Bottom Status Line (lualine.nvim)
  -- Replaces the default bottom bar with a sleek IDE status bar showing Git branch, file type, and Copilot status
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "/", right = "/" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },

  -- 4. Tag & Quote Surrounder (nvim-surround)
  -- Essential for Blade/HTML. Easily wrap variables or text in HTML tags, quotes, or brackets.
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- 5. Better Commenting (Comment.nvim)
  -- Quickly comment out lines or blocks of PHP, Blade, or JavaScript code
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },
}
