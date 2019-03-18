FROM ubuntu:16.04
RUN \
  apt -y update \
  && apt -y upgrade \
  && apt -y install \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils \
  && apt -y autoremove \
  && apt -y autoclean \
  && apt -y clean 
RUN cd /opt/x86
RUN git clone https://github.com/mxe/mxe.git \
  && cp -r /opt/x86 /opt/x64
RUN cd /opt/x86/mxe \
  && make --jobs=$(nproc) JOBS=$(nproc) MXE_TARGETS='i686-w64-mingw32.static' qtbase
RUN cd /opt/x64/mxe \
  && make --jobs=$(nproc) JOBS=$(nproc) MXE_TARGETS='x86_64-w64-mingw32.static' qtbase
ENV PATH="${PATH}:/opt/x86/mxe/usr/bin"
WORKDIR /project/build
CMD qmake /project/source && make -j $(nproc)