return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    commit = "4839ab6",
    lazy = false,
  },
  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    init = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
    end,
  },
  {
    "heavenshell/vim-pydocstring",
    lazy = false,
    init = function()
      vim.g.pydocstring_formatter = "google"
      vim.g.pydocstring_doq_path = "/Library/Frameworks/Python.framework/Versions/3.12/bin/doq"
    end,
  },
  {
    "wfxr/minimap.vim",
    lazy = false,
  },
  {
    "catppuccin/nvim",
    lazy = false,
  },
  {
    "echasnovski/mini.icons",
    version = false,
    lazy = false,
  },

  -- sql
  {
    "xemptuous/sqlua.nvim",
    lazy = false,
    config = function()
      require("sqlua").setup()
    end,
  },

  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
  },
  {
    "ellisonleao/glow.nvim",
    lazy = true,
    config = true,
    cmd = "Glow",
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },
  {
    "tris203/precognition.nvim",
    lazy = false,
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      highlightColor = { link = "Comment" },
      hints = {
        Caret = { text = "^", prio = 2 },
        Dollar = { text = "$", prio = 1 },
        MatchingPair = { text = "%", prio = 5 },
        Zero = { text = "0", prio = 1 },
        w = { text = "w", prio = 10 },
        b = { text = "b", prio = 9 },
        e = { text = "e", prio = 8 },
        W = { text = "W", prio = 7 },
        B = { text = "B", prio = 6 },
        E = { text = "E", prio = 5 },
      },
      gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      },
      disabled_fts = {
        "startify",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 10000,
    config = function()
      require("tiny-inline-diagnostic").setup {
        -- Style preset for diagnostic messages
        -- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
        preset = "modern",

        -- Set the background of the diagnostic to transparent
        transparent_bg = false,

        -- Set the background of the cursorline to transparent (only for the first diagnostic)
        -- Default is true in the source code, not false as in the old README
        transparent_cursorline = true,

        hi = {
          -- Highlight group for error messages
          error = "DiagnosticError",

          -- Highlight group for warning messages
          warn = "DiagnosticWarn",

          -- Highlight group for informational messages
          info = "DiagnosticInfo",

          -- Highlight group for hint or suggestion messages
          hint = "DiagnosticHint",

          -- Highlight group for diagnostic arrows
          arrow = "NonText",

          -- Background color for diagnostics
          -- Can be a highlight group or a hexadecimal color (#RRGGBB)
          background = "CursorLine",

          -- Color blending option for the diagnostic background
          -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
          -- Default is "Normal" in the source code
          mixing_color = "Normal",
        },

        options = {
          -- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
          show_source = {
            enabled = false,
            -- Show source only when multiple sources exist for the same diagnostic
            if_many = false,
          },

          -- Use icons defined in the diagnostic configuration instead of preset icons
          use_icons_from_diagnostic = false,

          -- Set the arrow icon to the same color as the first diagnostic severity
          set_arrow_to_diag_color = false,

          -- Add messages to diagnostics when multiline diagnostics are enabled
          -- If set to false, only signs will be displayed
          add_messages = true,

          -- Time (in milliseconds) to throttle updates while moving the cursor
          -- Increase this value for better performance on slow computers
          -- Set to 0 for immediate updates and better visual feedback
          throttle = 20,

          -- Minimum message length before wrapping to a new line
          softwrap = 30,

          -- Configuration for multiline diagnostics
          -- Can be a boolean or a table with detailed options
          multilines = {
            -- Enable multiline diagnostic messages
            enabled = false,

            -- Always show messages on all lines for multiline diagnostics
            always_show = false,

            -- Trim whitespaces from the start/end of each line
            trim_whitespaces = false,

            -- Replace tabs with this many spaces in multiline diagnostics
            tabstop = 4,
          },

          -- Display all diagnostic messages on the cursor line, not just those under cursor
          show_all_diags_on_cursorline = false,

          -- Enable diagnostics in Insert mode
          -- If enabled, consider setting throttle to 0 to avoid visual artifacts
          enable_on_insert = false,

          -- Enable diagnostics in Select mode (e.g., when auto-completing with Blink)
          enable_on_select = false,

          -- Manage how diagnostic messages handle overflow
          overflow = {
            -- Overflow handling mode:
            -- "wrap" - Split long messages into multiple lines
            -- "none" - Do not truncate messages
            -- "oneline" - Keep the message on a single line, even if it's long
            mode = "wrap",

            -- Trigger wrapping this many characters earlier when mode == "wrap"
            -- Increase if the last few characters of wrapped diagnostics are obscured
            padding = 0,
          },

          -- Configuration for breaking long messages into separate lines
          break_line = {
            -- Enable breaking messages after a specific length
            enabled = false,

            -- Number of characters after which to break the line
            after = 30,
          },

          -- Custom format function for diagnostic messages
          -- Function receives a diagnostic object and should return a string
          -- Example: function(diagnostic) return diagnostic.message .. " [" .. diagnostic.source .. "]" end
          format = nil,

          -- Virtual text display configuration
          virt_texts = {
            -- Priority for virtual text display (higher values appear on top)
            -- Increase if other plugins (like GitBlame) override diagnostics
            priority = 0,
          },

          -- Filter diagnostics by severity levels
          -- Available severities: vim.diagnostic.severity.ERROR, WARN, INFO, HINT
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
          },

          -- Events to attach diagnostics to buffers
          -- Default: { "LspAttach" }
          -- Only change if the plugin doesn't work with your configuration
          overwrite_events = nil,
        },

        -- List of filetypes to disable the plugin for
        disabled_ft = {},
      }

      vim.diagnostic.config { virtual_text = false } -- Disable default virtual text
    end,
  },

  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.deepseek.com/anthropic",
          model = "deepseek-chat",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
