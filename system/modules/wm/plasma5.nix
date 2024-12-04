{ config, lib, pkgs, ... }:
{
    # Enable the X11 windowing system.
  #services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # GTK integration for KDE
  programs.dconf.enable = true;  
  
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  kwrited
  ];
  
  environment.systemPackages = with pkgs; [ kate ];
}
