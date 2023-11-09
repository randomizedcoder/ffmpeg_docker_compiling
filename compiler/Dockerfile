#
# ffmpeg/Dockerfile_complier
#
# This docker image extends from ffmpeg/Dockerfile_builder, and is designed to do the compiling stage.
# This assumes "apt install blah" has already been done in the previous step
# The multi steps are helpful because iterating is slow otherwise

FROM siden-ffmpeg-builder:latest

# Librist install adapted from their Dockerfile
# https://code.videolan.org/rist/librist/-/blob/master/common/Dockerfile?ref_type=heads
RUN git clone --depth 1 https://code.videolan.org/rist/librist.git && \
    mkdir /librist/build
WORKDIR /librist/build
RUN meson .. --default-library=static --buildtype=release -Db_lto=true && \
    ninja
RUN ls -la /librist/build

# libsrt
# stolen from: https://stackoverflow.com/questions/50967706/how-to-compile-ffmpeg-with-enabling-libsrt/50975754#50975754
WORKDIR /
RUN git clone --depth 1 https://github.com/Haivision/srt.git && \
    mkdir srt/build
WORKDIR /srt/build
RUN cmake \
    -DENABLE_C_DEPS=ON -DENABLE_SHARED=OFF \
    -DENABLE_STATIC=ON .. && \
    make && \
    make install

ARG VERSION_FILE=SET_ME_IN_MAKEFILE

#ENV CFLAGS="-O3 -pipe"
ENV CFLAGS="-O4 -pipe"
ENV CXXFLAGS="${CFLAGS}"

WORKDIR /
#RUN git clone https://github.com/FFmpeg/FFmpeg.git
RUN wget https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN tar jxf ffmpeg-snapshot.tar.bz2

ENV SRC_PATH=/ffmpeg
WORKDIR /ffmpeg
#RUN /usr/bin/sed --in-place ./configure -e 's/hls_muxer_select="mov_muxer mpegts_muxer"/hls_muxer_select="mpegts_muxer"/'
# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg
# PKG_CONFIG_PATH="/librist/build/include/librist/"
RUN ./configure \
    --pkg-config-flags="--static" \
    --extra-cflags="-I/librist/build/include/librist/" \
    --extra-libs="-lpthread -lm" \
    --enable-librist \
    --enable-libsrt \
    --enable-libopenh264 \
    --enable-libx264 \
    --enable-libopenjpeg \
    --enable-libmp3lame \
    --enable-libcodec2 \
    --enable-libass \
    --enable-linux-perf \
    --enable-libxvid \
    --enable-libaom \
    --enable-libdav1d \
    --enable-libaom \
    --enable-libsvtav1 \
    --disable-ffplay \
    --disable-doc \
    --enable-gpl \
    --enable-version3 \
    --enable-static \
    --enable-random \
    --extra-version=siden-${VERSION_FILE} && \
    make -j$(nproc) && \
    make install && \
    make clean

#    --enable-librist \
#    --enable-libsrt \
#    --enable-librtmp \
#    --enable-libx265 \
#    --enable-libxml2 && \

# RUN apt-get autoremove \
#     autoconf \
#     automake \
#     build-essential \
#     cmake \
#     git-core \
#     libass-dev \
#     libfreetype6-dev \
#     libgnutls28-dev \
#     libmp3lame-dev \
#     libnuma-dev \
#     libopus-dev \
#     libsdl2-dev \
#     libtool \
#     libva-dev \
#     libvdpau-dev \
#     libvorbis-dev \
#     libvpx-dev \
#     libx264-dev \
#     libx265-dev \
#     libxcb1-dev \
#     libxcb-shm0-dev \
#     libxcb-xfixes0-dev \
#     texinfo \
#     yasm \
#     zlib1g-dev

#RUN rm -rf /var/lib/apt/lists/*