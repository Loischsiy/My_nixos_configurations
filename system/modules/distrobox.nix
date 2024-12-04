{ config, pkgs, ... }:
{
 hardware.nvidia-container-toolkit.enable = true;
 virtualisation.podman = {
  enable = true;
  #dockerCompat = true;
 };
 
 environment.systemPackages = [ pkgs.distrobox pkgs.nvidia-container-toolkit ];

}
