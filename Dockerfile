FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y \
                    build-essential \
                    gdb \
                    gcc-multilib-x86-64-linux-gnu \
                    tmux \
                    qemu-system-x86 \
                    gawk \
                    expect

ADD ./xv6-public /xv6-public

WORKDIR /xv6-public

ENV TOOLPREFIX=x86_64-linux-gnu-

CMD ["/bin/bash"]