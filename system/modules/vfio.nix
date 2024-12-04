let
  # RTX 3060 Laptop
  gpuIDs = [
    "10de:2520" # Graphics
    "10de:228e" # Audio
  ];
in { pkgs, lib, config, ... }: {
  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";

  config = let cfg = config.vfio;
  in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
      ];

      blacklistedKernelModules = [ "nouveau" ];

      kernelParams = [
        # enable IOMMU
        "amd_iommu=on"
      ] ++ lib.optional cfg.enable
        # isolate the GPU
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    #hardware.graphics.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    
    virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        user="dmitry"
      '';

      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          #package = pkgs.OVMFFull;
        };
        swtpm = {
          enable = true;
        };
        # 1000 is probably your userid
        verbatimConfig = ''
          namespaces = []
          user = "+1000"
        '';
      };
    };
  };

  programs.virt-manager.enable = true;

  # Create two boot in grub
  specialisation."VFIO".configuration = {
  system.nixos.tags = [ "with-vfio" ];
  vfio.enable = true;
  };

  };
}
