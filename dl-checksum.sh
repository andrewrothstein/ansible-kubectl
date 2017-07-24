#!/usr/bin/env sh
VER=v1.7.2
DIR=~/Downloads
wget -O $DIR/kubectl-linux-amd64-$VER https://storage.googleapis.com/kubernetes-release/release/$VER/bin/linux/amd64/kubectl
wget -O $DIR/kubectl-darwin-amd64-$VER https://storage.googleapis.com/kubernetes-release/release/$VER/bin/darwin/amd64/kubectl
wget -O $DIR/kubectl-windows-amd64.exe-$VER https://storage.googleapis.com/kubernetes-release/release/$VER/bin/windows/amd64/kubectl.exe
#sha256sum kubectl-*-$VER
shasum -a 256 $DIR/kubectl-*-$VER
