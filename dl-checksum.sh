#!/usr/bin/env sh
set -e
MIRROR=https://dl.k8s.io/release

TMPDIR_=$(mktemp -d)
trap 'rm -rf "$TMPDIR_"' EXIT

fetch()
{
    curl -fsSL --proto '=https' --tlsv1.2 -o "$2" "$1"
}

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local url=$MIRROR/$ver/bin/$os/$arch/kubectl$suffix
    local lfile=$TMPDIR_/kubectl-$os-$arch-$ver

    # always download fresh; never trust a cached file
    fetch "$url" "$lfile"
    local sum
    sum=$(sha256sum "$lfile" | awk '{print $1}')

    # cross-check against the checksum file upstream publishes next to the binary
    fetch "$url.sha256" "$lfile.sha256"
    local usum
    usum=$(awk '{print $1}' "$lfile.sha256")

    case "$sum" in
        *[!0-9a-f]*|"") echo "bad checksum for $url: '$sum'" >&2; exit 1;;
    esac
    if [ "${#sum}" -ne 64 ] || [ "$sum" != "$usum" ];
    then
        echo "checksum mismatch for $url: downloaded=$sum upstream=$usum" >&2
        exit 1
    fi

    printf "      # %s\n" "$url"
    printf "      %s: sha256:%s\n" "$arch" "$sum"
}

dlver () {
    local ver=$1
    printf "  %s:\n" "$ver"
    printf "    %s:\n" linux
    dl "$ver" linux amd64
    dl "$ver" linux arm
    dl "$ver" linux arm64
    dl "$ver" linux s390x
    dl "$ver" linux ppc64le
    printf "    %s:\n" darwin
    dl "$ver" darwin amd64
    dl "$ver" darwin arm64
    printf "    %s:\n" windows
    dl "$ver" windows amd64 .exe
    dl "$ver" windows arm64 .exe
}

dlver "${1:-v1.37.2}"
