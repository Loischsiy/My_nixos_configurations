{ stdenv, lib, fetchFromGitHub, kernel, kmod }:
stdenv.mkDerivation rec {
  name = " acer-rgb-turbo-${version}-${kernel.modDirVersion}";
  version = "main";

  src = fetchFromGitHub {
    owner = "Loischsiy";
    repo = "acer-rgb-turbo";
    rev = "${version}";
    sha256 = "9G2IB34puop1ax3HfvZuik/O6yQ8UjkpjZ1aA2GoOq0=";
  };

   setSourceRoot = ''
    export sourceRoot=$(pwd)/source
  '';
  nativeBuildInputs = kernel.moduleBuildDependencies;
  makeFlags = kernel.makeFlags ++ [
    "-C"
    "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(sourceRoot)"
  ];
  buildFlags = [ "modules" ];
  installFlags = [ "INSTALL_MOD_PATH=${placeholder "out"}" ];
  installTargets = [ "modules_install" ];


  meta = with lib; {
    description = "Improved Linux driver for Acer RGB Keyboards ";
    homepage = "https://github.com/Loischsiy/acer-rgb-turbo";
    license = licenses.gpl3;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
