# xv6-docker
Follow along with the MIT Operating Systems course (https://pdos.csail.mit.edu/6.828/2017/) for learning more about kernel and os development. This repo contains a dockerized environment for developing and debugging to xv6 kernel, with a few utilities to make things easier to get started.

## Getting Started

I've created a fork of the os source and linked as a submodule. To grab the source, update this dependency: 
```bash
git submodule update --init --recursive
```
The next step is to build the docker image. This will pull the required dependencies for compiling the xv6 source, grab/build the patched version of qemu for running the kernel and copy the linked source files into the container. Installing all the dependencies and compiling qemu takes a while, but it only has to be done once. 

```bash
docker build -t xv6 .
```

There are a few ways to run the kernel, depending on how you want to edit the source, run qemu, etc. 

To just run the image, without mounting any of the source for local editing, do the following:

```bash
docker run --rm -it xv6
```

This will launch a shell inside the container connected to your terminal. Note that any changes you make to the source code will not be persisted across container re-starts. To edit the files locally, run the following:

```bash
docker run --rm -it -v $PWD/jos:/jos xv6
```

You'll notice from the Dockerfile that tmux was added as an extra utility. This facilitates launching both qemu and gdb from seperate windows/panes for quickly inspecting instructions as the kernel is running.


## TODO
- Add support for qemu graphical display (low priority)
- Remove tmux from the container and run locally, connected to the container for persisting sessions





