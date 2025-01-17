# this script can be imported by other runtimes
mingw_version="6.0.0"
rs_triplets=true

declare -A rs_sources=(
    ["mingw-w64.tar.bz2"]="https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v${mingw_version}.tar.bz2"
)

declare -A rs_sha256sums=(
    ["mingw-w64.tar.bz2"]="805e11101e26d7897fce7d49cbb140d7bac15f3e085a91e0001e80b2adaf48f0"
)

mingw_prepare() {
    rs_extract_module "mingw-w64" "$rs_workdir/$1" "tar.bz2"
}

mingw_headers_build() {
    rs_do_command "$rs_workdir/$1/mingw-w64-v${mingw_version}/mingw-w64-headers/configure" --with-sysroot="$rs_prefixdir" --host="$rs_target" --prefix="$rs_prefixdir/$rs_target"
    rs_do_command $rs_makecmd -j $rs_cpucount
    rs_do_command $rs_makecmd install
}

mingw_crt_build() {
    rs_do_command "$rs_workdir/$1/mingw-w64-v${mingw_version}/mingw-w64-crt/configure" --with-sysroot="$rs_prefixdir" --host="$rs_target" --prefix="$rs_prefixdir/$rs_target"
    rs_do_command $rs_makecmd -j $rs_cpucount
    rs_do_command $rs_makecmd install
}
