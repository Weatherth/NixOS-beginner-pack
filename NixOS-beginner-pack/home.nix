{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "m";  # TODO change the username 'm' to yours
  home.homeDirectory = "/home/m";  # TODO same here
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
  # Add your packages here
  ];

  programs = {
 # Here you can add programs with your custom configs
 # Exemple:
 # programs.git = {
 #   enable = true;
 #   userName  = "my_git_username";
 #   userEmail = "my_git_username@gmail.com";
  };
}
