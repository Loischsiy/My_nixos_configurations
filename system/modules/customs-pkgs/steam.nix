{ config, pkgs, user, ... }:
let
   steamFonts = pkgs.symlinkJoin {
    name = "steam-fonts";
    paths = with pkgs; [
      source-han-serif
      source-han-sans
      noto-fonts-emoji
      wqy_zenhei
      wqy_microhei
    ];
  };
in
{
  programs = {
    steam = {
      enable = true;
      extraPackages = [ steamFonts ];
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [ mangohud ];
}
