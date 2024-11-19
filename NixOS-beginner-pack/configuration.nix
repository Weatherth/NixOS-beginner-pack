# /etc/nixos/configuration.nix
{ config, pkgs, imports, inputs, ... }:

{
  time.timeZone = "Europe/Paris";  # TODO set your timezone
  i18n.defaultLocale = "fr_FR.UTF-8";  # TODO set your locale
  services.xserver.xkb = {
    layout = "fr";  # TODO set your keyboard layout
    variant = "oss_latin9";  # TODO set your keyboard variant
  };
  console.keyMap = "fr";  # TODO set your console keyboard layout
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.nvidia.modesetting.enable = true;
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  system.stateVersion = "24.05"; # TODO Set/Leave this value at the release version of the first install of this system.
  imports = [
    ./configs/programs.nix
    ./configs/users.nix
    ./configs/nvidia.nix
    ./hardware-configuration.nix
   ];
}
