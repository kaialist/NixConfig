{ config, lib, pkgs, ... }:

{
    # Install firefox.
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Steam
    programs.steam.enable = true;

    # System Packages
    environment.systemPackages = with pkgs; [

    ];

}
