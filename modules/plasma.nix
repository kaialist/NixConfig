{ config, lib, pkgs, ... }:

{

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    ## Remove bloat
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        okular
        kate
        khelpcenter
        krdp
        elisa
    ];


    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

}
