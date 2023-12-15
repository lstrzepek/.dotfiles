return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    keys = {
      { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File Tests" },
      {
        "<leader>tF",
        "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        desc = "Debug File Tests",
      },
      { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last Test" },
      { "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", desc = "Debug Last Test" },
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run Nearest Test" },
      { "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest Test" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Test Output" },
      { "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop Test" },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test Summary" },
    },
    -- :h neotest.output
    -- :h neotest.output_panel
    -- :h neotest.summary
    -- :h neotest.diagnostic
    -- :h neotest.status
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
  {
    "klen/nvim-test",
    config = function()
      require("nvim-test").setup()
      require("nvim-test.runners.jest"):setup({
        command = "~/node_modules/.bin/jest", -- a command to run the test runner
        args = { "--collectCoverage=false" }, -- default arguments
        env = { CUSTOM_VAR = "value" }, -- custom environment variables

        file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
        find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

        filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
        working_directory = nil, -- set working directory (cwd by default)
      })
    end,
  },
}
