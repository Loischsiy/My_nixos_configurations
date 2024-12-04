{  pkgs, lib, ...}: {
  
  # root disable
  users.users.root.hashedPassword = "!";
   
  # Program that scans log files for repeated failing login attempts and bans IP addresses
  services.fail2ban.enable = true;
 
  # Firmware update
  services.fwupd.enable = true;
  
  security = {
    
    # enable tpm2
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };

    # doas or sudo commands enable or disable
    sudo.enable = false;

    doas = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

}
