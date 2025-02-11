{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    {
      nixpkgs,
      nvf,
      ...
    }@inputs:
    let
      inherit (builtins) readDir;
      inherit (nixpkgs.lib)
        attrNames
        ;

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      modulesDir = inputs.self + "/modules";
      modules.imports = map (mod: "${modulesDir}/${mod}") (attrNames (readDir modulesDir));

      mkNvimConf = pkgs: modules: (inputs.nvf.lib.neovimConfiguration { inherit pkgs modules; }).neovim;
    in
    {
      packages = forAllSystems (system: {
        nvf =
          let
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          in
          mkNvimConf pkgs [ modules ];
      });
    };
}
