{ config, lib, pkgs, ... }:
{
 virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
 };

 users.users.dmitry = {
     packages = with pkgs; [
       waydroid
     ];
   };
}
