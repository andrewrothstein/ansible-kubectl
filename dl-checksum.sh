#!/usr/bin/env sh
VER=v1.7.4
DIR=~/Downloads
MIRROR=https://storage.googleapis.com/kubernetes-release/release
wget -O $DIR/kubectl-linux-amd64-$VER $MIRROR/$VER/bin/linux/amd64/kubectl
wget -O $DIR/kubectl-darwin-amd64-$VER $MIRROR/$VER/bin/darwin/amd64/kubectl
wget -O $DIR/kubectl-windows-amd64.exe-$VER $MIRROR/$VER/bin/windows/amd64/kubectl.exe
sha256sum kubectl-*-$VER
#shasum -a 256 $DIR/kubectl-*-$VER
