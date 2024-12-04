{ config, lib, pkgs, ... }:
let acerbattery = config.boot.kernelPackages.callPackage ./acer-battery.nix {}; in
let acermodule = config.boot.kernelPackages.callPackage ./acer-module.nix {}; in
{
  # Custome kernel
  #boot.kernelPackages = pkgs.linuxPackages_xanmod; #lqx for liqrix kernel
  boot.extraModulePackages = [ acermodule acerbattery ];
  boot.kernelModules = [ "facer" "wmi" "sparse-keymap" "video" "acer-wmi-battery" ];
  boot.extraModprobeConfig = ''
    options acer-wmi-battery enable_health_mode=1 some_option=1
    '';
}
