{ config, lib, pkgs, ... }:

{
    # Install firefox.
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # System Packages
    environment.systemPackages = with pkgs; [
        git

    ];

}
