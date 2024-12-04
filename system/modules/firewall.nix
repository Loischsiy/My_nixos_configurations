{ config, lib, ... }:{
  networking.firewall = { 
    enable = true;
    #allowedTCPPortRanges = [ 
    #  { from = 1714; to = 1764; } # kde connect
    #];  
    #allowedUDPPortRanges = [ 
    #  { from = 1764; to = 1764; } # kde connect
    #];  
  };  
}
