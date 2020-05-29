# with import <nixpkgs> {};

let

  nixpkgs = import <nixpkgs> {};

  inherit (nixpkgs) stdenv fetchurl which;

  libprime = import ./default.nix;

  numbers = stdenv.mkDerivation {
    name = "numbers-0.1";
 
    src  =  ./.;
    buildInputs = [ libprime ];
    inherit libprime;

    buildPhase = ''
      gcc -o numbers main.c $libprime/lib/libprime.so
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp numbers $out/bin
    '';
};

in numbers
