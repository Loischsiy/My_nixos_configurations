{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
     settings = {
       General = {
         Enable = "Source,Sink,Media,Socket";
         FastConnectable = "true";
         Experimental = true;
         KernelExperimental = "true";
       };
     };
  };
}
