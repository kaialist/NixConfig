{ config, lib, pkgs, ... }:

{
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelParams = [ "quiet" "nvidia.NVreg_EnableGpuFirmware=0" ];

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_6_11;
}
