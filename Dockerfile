FROM fedora:latest

RUN yum -y install buildah fuse-overlayfs --exclude container-selinux; rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN echo $' \n\
FROM httpd:2.4 \n\
RUN mkdir /public-html \n\
RUN echo 'hello' > /public-html/index.html \n\
COPY /public-html/ /usr/local/apache2/htdocs/' >> /tmp/Dockerfile


ADD build.sh /usr/bin
RUN chmod a+x /usr/bin/build.sh
# /usr/bin/build.sh contains the actual custom build logic that will be run when
# this custom builder image is run.
ENTRYPOINT ["/usr/bin/build.sh"]
