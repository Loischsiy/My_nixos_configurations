{ pkgs, lib, ... }:
{
  nixpkgs.overlays = [
  (self: super: {
    #nekoray = super.libsForQt5.callPackage ./nekoray.nix {};
    v2raya = super.callPackage ./v2rayA-xray.nix {};
  })
  ];
}
