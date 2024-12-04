{ stdenv, lib, fetchFromGitHub, kernel, kmod }:
stdenv.mkDerivation rec {
  pname = "acer-wmi-battery";
  version = "main";

  src = fetchFromGitHub {
    owner = "frederik-h";
    repo = "acer-wmi-battery";
    rev = "${version}";
    sha256 = "2uVIMvUxIXWz0nK61ukUg7Rh9SVQbyjWr7++hh8mEC0=";
  };

  hardeningDisable = [ "pic" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  setSourceRoot = ''
    export sourceRoot=$(pwd)/source
  '';
  makeFlags = kernel.makeFlags ++ [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
  ];

  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
    cp acer-wmi-battery.ko $out/lib/modules/${kernel.modDirVersion}/extra/
  '';

  meta = with lib; {
    description = "Acer WMI battery driver for Linux";
    homepage = "https://github.com/frederik-h/acer-wmi-battery";
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}

