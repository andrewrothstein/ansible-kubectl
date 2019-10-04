#!/usr/bin/env sh
VER=${1:-v1.16.1}
DIR=~/Downloads
MIRROR=https://storage.googleapis.com/kubernetes-release/release/$VER/bin

dl()
{
    local os=$1
    local arch=$2
    local suffix=${3:-}
    local url=$MIRROR/$os/$arch/kubectl$suffix
    local lfile=$DIR/kubectl-$os-$arch-$VER 

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

printf "  %s:\n" $VER
printf "    %s:\n" linux
dl linux amd64
dl linux arm64
printf "    %s:\n" darwin
dl darwin amd64
printf "    %s:\n" windows
dl windows amd64 .exe


