source $stdenv/setup

export PATH="$coreutils/bin:$gcc/bin:$gnutar/bin:$gzip/bin:$gnumake/bin"

mkdir $out
tar -C $out -xvf $src
./configure --prefix=$out

make
make install
