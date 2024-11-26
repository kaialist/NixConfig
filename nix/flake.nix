{
  description = "NixConfig";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nix = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            ./configuration.nix
            modules/nvidia.nix
          ];
      };
    };
  };
}
