{ config, lib, ... }:{
  programs = {
    zsh = {
      enable = true;
      shellAliases = {

        garbage =     "doas nix-collect-garbage -d";
        cl =          "doas nix-store --gc";
        lgens =       "doas nix-env --profile /nix/var/nix/profiles/system --list-generations";
        neu =         "doas nix-env --upgrade";
        nopt =        "doas nix-store --optimise";
        rbs =         "doas nixos-rebuild switch";
        rbsu =        "cd /etc/nixos && doas nix flake update && doas nixos-rebuild switch";
        fpcl =        "flatpak uninstall --unused";
        ff =          "fastfetch";
        nf =          "neofetch";
        clr =         "clear";

   };
  };
 };
}

