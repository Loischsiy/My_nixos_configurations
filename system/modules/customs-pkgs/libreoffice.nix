{ config, lib, pkgs, ... }:
{
 users.users.dmitry = {
     packages = with pkgs; [
       libreoffice-qt6
       hunspell
       hunspellDicts.uk_UA
       hunspellDicts.ru_RU
       hunspellDicts.en_US
     ];
   };
}
