FROM fedora:latest

RUN yum -y install buildah fuse-overlayfs --exclude container-selinux; rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN echo $' \n\
FROM docker.io/alpine \n\
RUN env \n\
ENTRYPOINT env ' >> /tmp/Dockerfile


ENTRYPOINT buildah bud -f /tmp/Dockerfile test
