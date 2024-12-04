{ config, lib, pkgs, ... }:
{
   imports = [
    ./gnome-extensions.nix
  ];

    # Enable the GNOME desktop environment
    services.xserver = {
    desktopManager.gnome.enable = true;

    displayManager = {
      gdm.enable = true;
    };
  };

  services.gnome = {
    games.enable = false;
    core-developer-tools.enable = false;
    gnome-remote-desktop.enable = false;
    gnome-keyring.enable = true;
  };


  programs = {
    gnome-terminal.enable = true;
    gnome-disks.enable = true;
    evince.enable = true; #           # Document viewer
    file-roller.enable = true; #      # Archive manager
    seahorse.enable = false; #         # Passwords and Keys
    geary.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-photos
    gnome-tour
    geary
    yelp
    gnome.gnome-characters
  ];

    environment.systemPackages = with pkgs; [ gnome-tweaks pkgs.gnome-extension-manager ];
    services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
