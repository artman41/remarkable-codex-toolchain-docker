FROM ubuntu:22.10

ARG TOOLCHAIN_FILENAME

RUN apt update && apt install -y python2 wget

RUN wget https://storage.googleapis.com/remarkable-codex-toolchain/${TOOLCHAIN_FILENAME} -O /tmp/${TOOLCHAIN_FILENAME}

RUN apt install -y gcc g++

RUN apt install -y xz-utils

RUN /bin/sh /tmp/${TOOLCHAIN_FILENAMEi} -y
