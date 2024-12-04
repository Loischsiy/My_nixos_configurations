{ config, pkgs, ... }:

{
  # Make sure opengl is enabled
  hardware.graphics.enable = true;

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Type driver open or not
    open = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = true;

    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;

    # Enable the nvidia settings menu
    nvidiaSettings = false;

    #Fixes a glitch
    nvidiaPersistenced = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
     offload = {
       enable = true;
       enableOffloadCmd = true;
     };
     
     sync.enable = false;

     #reverseSync.enable = true;
     # Enable if using an external GPU
     #allowExternalGpu = false;

     amdgpuBusId = "PCI:5:0:0";
     nvidiaBusId = "PCI:1:0:0";
   };
  };
}
