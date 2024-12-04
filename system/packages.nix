{ inputs, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gparted
    v2raya

    # games
    inputs.umu.packages.${pkgs.system}.umu

    # CLI utils
    zram-generator
    ntfs3g
    virtiofsd

    # amd microcode updated
    microcode-amd

    # optimized process in linux
    ananicy-cpp
    ananicy-rules-cachyos

  ];

  fonts = {
    packages = with pkgs; [
      material-icons
      roboto
      source-sans
      twemoji-color-font
      inter
      lexend
      iosevka-bin
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      corefonts
      jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
    ];
    
    fontDir.enable = true;
    enableDefaultPackages = false;

    # this fixes emoji stuff
    fontconfig = {
      defaultFonts = {
        monospace = [
          "Iosevka Term"
          "Iosevka Term Nerd Font Complete Mono"
          "Iosevka Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = ["Lexend" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
