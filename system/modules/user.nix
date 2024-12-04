{ inputs, pkgs, ... }: {
  
  users = {
    defaultUserShell = pkgs.zsh;
    
    users.dmitry = {
      isNormalUser = true;
      description = "Дмитрий";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "video" "tss" ];
      packages = with pkgs; [
        # Desktop apps
        nekoray
        firefox
        miru
        #figma-agent
        #google-chrome
        chromium
        telegram-desktop
        vlc
        vesktop
        looking-glass-client
        vscode
        qbittorrent
        #kdiskmark
    
        # audio
        mousai

        # Security app
        bitwarden-desktop

        # Games
        prismlauncher
        lutris

        # CLI Tools
        f2fs-tools
        wget
        htop
        neofetch
        fastfetch
        python310
        p7zip
        unrar
        unzip
        wireguard-tools

        # Android screan to pc
        scrcpy

        # Doas to sudo
        doas-sudo-shim
      ];
    };
  };

  # Enable automatic login for the user.
 #services.getty.autologinUser = "dmitry";
 # services.displayManager.autoLogin.enable = true;
 # services.displayManager.autoLogin.user = "dmitry";
}
