#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://storage.googleapis.com/kubernetes-release/release

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local url=$MIRROR/$ver/bin/$os/$arch/kubectl$suffix
    local lfile=$DIR/kubectl-$os-$arch-$ver

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

dlver () {
    local ver=$1
    printf "  %s:\n" $ver
    printf "    %s:\n" linux
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver linux s390x
    dl $ver linux ppc64le
    printf "    %s:\n" darwin
    dl $ver darwin amd64
    dl $ver darwin arm64
    printf "    %s:\n" windows
    dl $ver windows amd64 .exe
    dl $ver windows arm64 .exe
}

dlver ${1:-v1.31.0}
