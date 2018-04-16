#!/usr/bin/env sh
VER=v1.10.1
DIR=~/Downloads
MIRROR=https://storage.googleapis.com/kubernetes-release/release
wget -O $DIR/kubectl-linux-amd64-$VER $MIRROR/$VER/bin/linux/amd64/kubectl
wget -O $DIR/kubectl-linux-arm64-$VER $MIRROR/$VER/bin/linux/arm64/kubectl
wget -O $DIR/kubectl-darwin-amd64-$VER $MIRROR/$VER/bin/darwin/amd64/kubectl
sha256sum $DIR/kubectl-*-$VER
#shasum -a 256 $DIR/kubectl-*-$VER
