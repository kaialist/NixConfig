{ config, lib, pkgs, ... }:

{

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Steam
    programs.steam.enable = true;

    # System Packages
    environment.systemPackages = with pkgs; [
        vscode
    ];

}
