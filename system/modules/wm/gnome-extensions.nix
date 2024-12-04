{ pkgs, ... }:
{
environment.systemPackages = with pkgs.gnomeExtensions; [
        appindicator
        dash-to-dock
        space-bar
        auto-move-windows
        rounded-window-corners-reborn
        removable-drive-menu
        caffeine
        lock-keys
        user-themes
        window-title-is-back
        user-avatar-in-quick-settings
        vitals
        alttab-mod
       ];
}
