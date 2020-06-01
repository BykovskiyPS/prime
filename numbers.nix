# with import <nixpkgs> {};

let

  nixpkgs = import <nixpkgs> {};

  prime_lib_commit = "eb4aed1377704bf69771042ef89d0b07271a7a26";
  prime_lib = pkgs.callPackage(buiktins.fetchTarball{
    url = "https://github.com/BykovskiyPS/prime_lib/archive/prime_lib.tar.gz";
    sha256 = "19153jq0ix097g9w7iw5x4q6mv7kcqa4naqp6jnbpv9d9dcv3b30";
  }) {};
in 
stdenv.mkDerivation {
    name = "numbers-0.1";
 
    src  =  ./.;
    buildInputs = [ libprime ];
    
    buildPhase = ''
      gcc -o numbers main.c $libprime/lib/libprime.so
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp numbers $out/bin
    '';
}
