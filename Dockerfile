FROM fedora:latest

RUN yum -y install buildah fuse-overlayfs --exclude container-selinux; rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN echo $' \n\
FROM httpd:2.4 \n\
RUN mkdir /public-html \n\
RUN echo 'hello' > /public-html/index.html \n\
COPY /public-html/ /usr/local/apache2/htdocs/' >> /tmp/Dockerfile


ENTRYPOINT buildah --storage-driver vfs bud --isolation chroot -f /tmp/Dockerfile -t test
