{
  description = "NixConfig";


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = inputs@{ nixpkgs, home-manager, plasma-manager, firefox-addons, ... }: {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          modules/gnome.nix
          modules/kernel.nix
          modules/locale.nix
          modules/nvidia.nix
          modules/packages.nix
          modules/security.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kaia = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }

        ];
      };
    };
  };

}
