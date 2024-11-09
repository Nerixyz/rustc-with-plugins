FROM ubuntu:24.04

# This is mostly based on https://github.com/tsaarni/docker-deb-builder

ARG DEBIAN_FRONTEND=noninteractive

RUN <<EOF

set -ex

apt update
apt install -y --no-install-recommends \
    build-essential git cmake ninja-build \
    git cmake ninja-build ca-certificates \
    libssl-dev python3 curl pkg-config \
    clang-18 llvm-18-dev libpolly-18-dev liblld-18-dev libzstd-dev zlib1g-dev libxml2-dev
apt clean
rm -rf /tmp/* /var/tmp/*

update-ca-certificates

EOF

ENV CC clang-18
ENV CXX clang++-18
ENV DESTDIR /output

COPY . /build/source

VOLUME /output

CMD /build/source/build-it.sh
