FROM ubuntu:24.04

# This is mostly based on https://github.com/tsaarni/docker-deb-builder

ARG DEBIAN_FRONTEND=noninteractive

RUN <<EOF

set -ex

update-ca-certificates

apt update
apt install -y --no-install-recommends \
    build-essential git cmake ninja-build clang-18 \
    git cmake ninja-build \
    libssl-dev python3 curl pkg-config llvm-18-dev
apt clean
rm -rf /tmp/* /var/tmp/*

EOF

ENV CC clang-18
ENV CXX clang++-18
ENV DESTDIR /output

COPY . /build/source

VOLUME /output

CMD /build/source/build-it.sh
