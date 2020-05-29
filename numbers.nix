{ stdenv }:

stdenv.mkDerivation {
  name = "numbers-0.1";
  builder = ./builder.sh;
  src fetchurl {
    url =  https://github.com/BykovskiyPS/prime.git;
    sha256 = ""07q5bl5ld3yx19n08qsibbagkbqibsk6znqa4b5lb3fcwgc88f05;
  };
} 
