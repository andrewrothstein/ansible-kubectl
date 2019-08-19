#!/usr/bin/env sh
VER=v1.15.3
DIR=~/Downloads
MIRROR=https://storage.googleapis.com/kubernetes-release/release/$VER/bin

dl()
{
    OS=$1
    PLATFORM=$2
    SUFFIX=${3:-}
    URL=$MIRROR/$OS/$PLATFORM/kubectl$SUFFIX
    LFILE=$DIR/kubectl-$OS-$PLATFORM-$VER 

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "      # %s\n" $URL
    printf "      %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
printf "    %s:\n" linux
dl linux amd64
dl linux arm64
printf "    %s:\n" darwin
dl darwin amd64
printf "    %s:\n" windows
dl windows amd64 .exe


