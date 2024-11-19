{ config, pkgs, self, ... }:

{
  users.users.m = {  # change 'm' by your username
    isNormalUser = true;
    description = "m";  # change 'm' by your username
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    # Add the packages you want only for your user here
    ];
  };
  users.defaultUserShell = pkgs.zsh;
}
