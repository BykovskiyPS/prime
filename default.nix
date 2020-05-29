with import <nixpkgs> {};

stdenv.mkDerivation {

  name = "libprime-0.1";

  src = ./sourses;

  buildPhase = ''
    gcc -fPIC -c prime.c
    gcc -shared -o libprime.so prime.o prime.h
  '';

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/include

    cp libprime.so $out/lib
    cp prime.h     $out/include
  '';
}
