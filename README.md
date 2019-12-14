# Pune Linux Users Group

## containers

### test distros

1. rhel 8
2. centos 8
3. fedora 31

### what are containers?

[Standard Definition of Containers](https://github.com/opencontainers/runtime-spec/blob/master/spec.md)

1. talk about virtualisation
2. talk about vms vs. containers
3. talk about container runtimes (mention docker) (only mention names)

### structure of containers

0. containers are meant to be *ephemeral*

1. layers
	1. snapshots in points of time
	2. layers can be shared

2. tags
	1. points to different layers
	2. helps in versioning

### buildah and podman

1. podman demo - 
  1. podman pull
  2. podman images --all
  3. podman history
  4. podman run --name
  5. podman diff
  
  <!-- Storage -->
  <!-- Types of storages: -->
  6. podman volume
    1. create
    2. ls
    3. inspect
	4. podman run ... -v <source_dir_on_host>:<mount_dir_inside_docker>:<options_such_as_readonly> ...
  7. bind mounts (not covering)

	  > If you mount a bind mount or non-empty volume into a directory in the container in
	  > which some files or directories exist, these files or directories are obscured by
	  > the mount, just as if you saved files into /mnt on a Linux host and then mounted a
	  > USB drive into /mnt. The contents of /mnt would be obscured by the contents of the
	  > USB drive until the USB drive were unmounted. The obscured files are not removed or
	  > altered, but are not accessible while the bind mount or volume is mounted.

  8. `tmpfs` (not covering)

  9. port forwarding

### dockerfiles and dockerization

1. not case-sensitive, but convention dictates using CAPS.

2. Syntaxes
	1. ARG
	2. FROM
	3. RUN 
	  1. create layers
	  2. remote URLs should be accessed using `wget` with RUN instead of ADD or COPY
	4. ADD/COPY
	5. WORKDIR
	6. VOLUME
	7. EXPOSE

3. dockerfile example
	1. webpage which displays three images
		2. one image - ephemeral
		2. second image - volume
		2. third image - mount
	3. expose container port to host

	4. each operation as layer

### links

0. [Best Overview resource](https://bt0dotninja.fedorapeople.org/Containers_101_with_Podman_on_Fedora29.pdf)
1. [Docker Jumpstart](https://odewahn.github.io/docker-jumpstart)
2. [podman - Commands](https://github.com/containers/libpod/blob/master/commands.md)
3. [Open Repository for Container Tools](https://github.com/containers)
4. [Containers (the repo) - Demos](https://github.com/containers/Demos)
5. [Docker - Manage data in Docker](https://docs.docker.com/storage/)
6. [Dockerfile - Options](https://docs.docker.com/engine/reference/builder/)
7. [Standard Definition of Containers](https://github.com/opencontainers/runtime-spec/blob/master/spec.md)
8. [Dockerless, part 1: Which tools to replace Docker with and why](https://mkdev.me/en/posts/dockerless-part-1-which-tools-to-replace-docker-with-and-why)
9. [How to fix docker: Got permission denied while trying to connect to the Docker daemon socket](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket)
10. [Going Rootless](https://docs.docker.com/engine/security/rootless/) **IMPORTANT**
11. [Containers - Full Stack Python](https://www.fullstackpython.com/containers.html)
12. [Containers from Scratch](https://ericchiang.github.io/post/containers-from-scratch/)

## cgroups

burn a lot of cpu

```
dd if=/dev/zero of=/dev/null &
```

burn a lot of memory

```python
import time
abc=[]
while True:
	unit=bytearray(1024*1024*1024)
	abc.append(unit)
	time.sleep(2)
```

## oom

1. oom_killer, oom_victime, oom_reaper

