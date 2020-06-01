with import <nixpkgs> {};
#{ stdenv, pkgs }:
let
  libprime = builtins.fetchTarball {
    url = "https://github.com/BykovskiyPS/libprime/archive/libprime.tar.gz";
    sha256 = "1hyqa01x3i6r0s74zb69ja57m4psv1fkac2ds4mgzq2b1s8s4wh6";
  };
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
