{ stdenv, pkgs }:

let
  libprime = pkgs.callPackage (builtins.fetchTarball {
    url = "https://github.com/BykovskiyPS/libprime/archive/master.tar.gz";
    sha256 = "03wsf2rh8lgrxdbdnjcwm6yng50jmr4cp6yqkh22p87yjmai4ca2";
  }) {};
in 
stdenv.mkDerivation {
    name = "numbers";
 
    src = builtins.path { path = ./.;};
    buildInputs = [ libprime ];
    buildPhase = ''
      gcc -c -o main.o sources/main.c
      gcc -o numbers main.o  ${libprime}/lib/libprime.so
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp numbers $out/bin
    '';
}
