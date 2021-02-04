FROM fedora:latest

RUN yum -y install buildah fuse-overlayfs --exclude container-selinux; rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN echo $' \n\
FROM docker.io/alpine \n\
RUN env \n\
RUN ps aux > /tmp/ps \n\
ENTRYPOINT cat /tmp/ps ' >> /tmp/Dockerfile


ENTRYPOINT buildah --storage-driver vfs bud --isolation chroot -f /tmp/Dockerfile -t test
