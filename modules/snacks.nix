{ pkgs, ... }:
{
  config.vim.lazy.plugins = {
    "snacks.nvim" = {
      package = pkgs.vimPlugins.snacks-nvim;
      setupModule = "snacks";
      setupOpts = {
        option_name = true;
        lazygit.enabled = true;
      };
      after = ''
        -- custom lua code to run after plugin is loaded
        print('snacks loaded')
      '';

      # Explicitly mark plugin as lazy. You don't need this if you define one of
      # the trigger "events" below
      lazy = true;

      # load on event
      event = [ "BufEnter" ];

      keys = [
        {
          key = "<leader>gg";
          action = ":lua Snacks.lazygit.open()<CR>";
          mode = [ "n" ];
        }
      ];
    };
  };
}
