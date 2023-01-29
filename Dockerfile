FROM ubuntu:18.04

RUN apt-get -qq update

RUN apt-get install -y \
                    build-essential \
                    gdb \
                    gcc-multilib-x86-64-linux-gnu \
                    tmux \
                    qemu-system-x86

ADD ./xv6-public /xv6-public

WORKDIR /xv6-public

ENV TOOLPREFIX=x86_64-linux-gnu-

CMD ["/bin/bash"]