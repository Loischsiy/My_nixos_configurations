{ config, lib, pkgs, ... }:
{
  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the Plasma 6 Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
 
  # GTK integration for KDE
  programs.dconf.enable = true;   

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  elisa
  krdp
  ];  

  environment.systemPackages = with pkgs; [ icoutils kdePackages.kcalc ];
}
