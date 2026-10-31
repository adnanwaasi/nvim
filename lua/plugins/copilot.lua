return {
  {
    "github/copilot.vim",
    config = function()
      -- Enable Copilot for all file types
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
      
      -- Copilot key mappings
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion",
      })
      
      vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", {
        desc = "Accept Copilot word",
      })
      
      vim.keymap.set("i", "<C-K>", "<Plug>(copilot-previous)", {
        desc = "Previous Copilot suggestion",
      })
      
      vim.keymap.set("i", "<C-N>", "<Plug>(copilot-next)", {
        desc = "Next Copilot suggestion",
      })
      
      -- Disable default Tab mapping to avoid conflicts with completion
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true, -- Enable debugging
      -- Custom prompts
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.",
        },
        Review = {
          prompt = "/COPILOT_REVIEW Review the selected code.",
          callback = function(response, source)
            -- Custom callback for review
          end,
        },
        Fix = {
          prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
        },
        Optimize = {
          prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability.",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
        },
        Tests = {
          prompt = "/COPILOT_GENERATE Please generate tests for my code.",
        },
        FixDiagnostic = {
          prompt = "Please assist with the following diagnostic issue in file:",
          selection = function(source)
            return require("CopilotChat.select").diagnostics(source)
          end,
        },
        Commit = {
          prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          selection = function(source)
            return require("CopilotChat.select").gitdiff(source)
          end,
        },
        CommitStaged = {
          prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
          selection = function(source)
            return require("CopilotChat.select").gitdiff(source, true)
          end,
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      -- Key mappings for CopilotChat
      vim.keymap.set("n", "<leader>cc", ":CopilotChat ", { desc = "CopilotChat - Open chat" })
      vim.keymap.set("v", "<leader>cc", ":CopilotChat ", { desc = "CopilotChat - Open chat with selection" })
      vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set("n", "<leader>cr", ":CopilotChatReview<CR>", { desc = "CopilotChat - Review code" })
      vim.keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "CopilotChat - Fix code" })
      vim.keymap.set("n", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
      vim.keymap.set("n", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "CopilotChat - Add docs" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
      vim.keymap.set("n", "<leader>cfd", ":CopilotChatFixDiagnostic<CR>", { desc = "CopilotChat - Fix diagnostic" })
      vim.keymap.set("n", "<leader>ccm", ":CopilotChatCommit<CR>", { desc = "CopilotChat - Generate commit message" })
      vim.keymap.set("n", "<leader>ccs", ":CopilotChatCommitStaged<CR>", { desc = "CopilotChat - Generate commit message for staged" })
    end,
  },
}