return {
  {
    'yetone/avante.nvim',
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = function()
      -- conditionally use the correct build system for the current OS
      if vim.fn.has 'win32' == 1 then
        return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
      else
        return 'make'
      end
    end,
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- for example
      provider = 'ollama',
      providers = {
        gemini = {
          -- model = 'gemini-2.5-flash',
        },
        openai = {
          endpoint = 'http://localhost:1234/v1',
          api_key_name = '',
        },
        ollama = {
          -- lm studio is openai compatible
          -- __inherited_from = 'openai',
          -- api_key_name = '',
          -- endpoint = 'http://192.168.1.98:1234/v1',
          -- model = 'qwen/qwen2.5-coder-32b',
          endpoint = 'http://127.0.0.1:11434',
          model = 'devstral:24b-small-2505-q8_0',
        },
      },
      -- behaviour = {
      --   auto_approve_tool_permissions = { 'replace_in_file' }, -- auto-approve replace_in_file tool only
      -- },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'echasnovski/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'stevearc/dressing.nvim', -- for input provider dressing
      'folke/snacks.nvim', -- for input provider snacks
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
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
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
