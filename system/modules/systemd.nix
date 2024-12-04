{
  services.journald.extraConfig = "SystemMaxUse=100M";

#   systemd.services.v2raya = {
#     enable = true;
#     description = "v2rayA gui client";
#     after = [ "network.target" ];
#     serviceConfig = {
#       Restart = "always";
#       ExecStart = "${v2rayA}/bin/v2rayA";
#     };
#     path = with pkgs; [ iptables bash ];
#     wantedBy = [ "multi-user.target" ];
#
#   };
}
