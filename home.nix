{ pkgs, inputs, ... }:
{
  # Enable
  programs.home-manager.enable = true;

  # State Version - dont change unless it maches configuration.nix
  home.stateVersion = "24.05";

  # Packages in Home
  home.packages = with pkgs; [
    fastfetch
    discord
    btop
    qbittorrent
    heroic
    protontricks
  ];

  # Firefox
  programs.firefox.enable = true;

  # Git
  programs.git = {
    enable = true;
    userEmail = "kaia.gonza@outlook.com";
    userName = "kaialist";
  };

  # Scripts
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "cd /home/kaia/nix && sudo nix flake update && nix flake check && sudo nixos-rebuild switch --flake .";
      edit = "code /home/kaia/nix && exit";
    };
  };


}
