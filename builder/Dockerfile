#
# ffmpeg/Dockerfile_builder
#
# This docker image adds all the apt packages, for all the dependancies for compiling ffmpeg

# Using latest Ubuntu, becasue I thought we would get newer libraries
# https://hub.docker.com/_/ubuntu/
FROM ubuntu:23.10 AS build

# I did try Debian originally, but maybe I had miss configured.  I should double check this at some point.
# https://hub.docker.com/_/debian/
#FROM debian:bookworm-slim AS build

# Compile and install fresh ffmpeg from sources:
# See: https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install \
        autoconf \
        automake \
        build-essential \
        cmake \
        git-core \
        libass-dev \
        libfreetype6-dev \
        libgnutls28-dev \
        libmp3lame-dev \
        libsdl2-dev \
        libtool \
        libva-dev \
        libvdpau-dev \
        libvorbis-dev \
        libxcb1-dev \
        libxcb-shm0-dev \
        libxcb-xfixes0-dev \
        pkg-config \
        texinfo \
        wget \
        zlib1g-dev \
        nasm \
        yasm \
        meson \
        ninja-build \
        libopenh264-dev \
        libx264-dev \
        libnuma-dev \
        libx265-dev \
        librist-dev \
        libopenjp2-7-dev \
        libmp3lame-dev \
        libcodec2-dev \
        libfdk-aac-dev \
        libass-dev \
        libxvidcore-dev \
        libaom-dev \
        libsvtav1-dev \
        libsvtav1dec-dev \
        libsvtav1enc-dev \
        libdav1d-dev \
        libsrtp2-dev \
        libxml2-dev \
        librtmp-dev \
        librist-dev \
        libunistring-dev \
        libmicrohttpd-dev \
        libcjson-dev \
        libmbedtls-dev \
        libmbedcrypto7 \
        libcmocka-dev \
        libssl-dev \
        libsrtp2-dev \
        libsrt-openssl-dev \
        libsrtp2-1 \
        inotify-tools