{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
  kitty
  gnome-text-editor
  gnome.nautilus
  git
  github-desktop
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    };

  programs.firefox.enable = true;

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      };
    gnome.core-utilities.enable = false;
    printing.enable = true;
    };
}
