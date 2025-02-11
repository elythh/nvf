_: {
  vim.statusline.lualine = {
    enable = true;
    refresh.statusline = 100;
    ignoreFocus = [
      "neo-tree"
      "dapui_watches"
      "dapui_breakpoints"
      "dapui_scopes"
      "dapui_console"
      "dapui_stacks"
      "dap-repl"
    ];
    activeSection = {
      a = [
        ''
          {
            "mode",
            fmt = function()
              return ""
            end,
            separator = { left = '▎' },
          }
        ''
        ''
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            separator = { right = '' },
          }
        ''
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
      ];
      b = [
        ''
          {
            "filetype",
            colored = true,
            icon_only = true,
            icon = { align = 'left' }
          }
        ''
        ''
          {
            "filename",
            symbols = {modified = ' ', readonly = ' '},
            separator = {right = ''}
          }
        ''
      ];
      c = [
        ''
          {
            "diff",
            separator = {right = ''}
          }
        ''
      ];
      x = [
        ''
          {
            function()
              return require("dap").status()
            end,
            separator = {left = ''}
          }
        ''
        ''
          {
            "diagnostics",
            sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
            symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
            colored = true,
            update_in_insert = false,
            always_visible = false,
            diagnostics_color = {
              color_error = { fg = 'red' },
              color_warn = { fg = 'yellow' },
              color_info = { fg = 'cyan' },
            },
          }
        ''
      ];
      y = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
        ''
          {
            "searchcount",
            maxcount = 999,
            timeout = 120,
            separator = {left = ''}
          }
        ''
        ''
          {
            "branch",
            icon = ' •',
            separator = {left = ''}
          }
        ''
      ];
      z = [
        ''
          {
            "",
            draw_empty = true,
            separator = { left = '', right = '' }
          }
        ''
        ''
          {
            "progress",
            separator = {left = ''}
          }
        ''
        ''
          { "location" }
        ''
        ''
          {
            "fileformat",
            color = {fg='black'},
            symbols = {
              unix = '', -- e712
              dos = '',  -- e70f
              mac = '',  -- e711
            }
          }
        ''
      ];
    };
  };
}
