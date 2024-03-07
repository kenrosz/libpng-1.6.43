#!/usr/bin/env bash
set -e
prefix="$HOME/opt"
[[ -d "$prefix" ]] || mkdir -p "$prefix"
[[ -f libpng.sums ]] || cat <<-EOF > libpng.sums
    6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c  libpng-1.6.43.tar.xz
EOF
[[ -f libpng-1.6.43.tar.xz ]] || curl -L --fail ""https://downloads.sourceforge.net/project/libpng/libpng16/1.6.43/libpng-1.6.43.tar.xz"" -o "./libpng-1.6.43.tar.xz"
/usr/bin/shasum -a 256 -c libpng.sums
xzcat ./libpng-1.6.43.tar.xz | tar xv -
cd libpng-1.6.43
./configure --prefix="$prefix"
make
make test
make install
cd ..
rm -rf ./libpng-1.6.43
