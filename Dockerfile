FROM docker.io/buildah/buildah

RUN apk add --no-cache wget bash openjdk11 maven --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

# https://github.com/sgerrand/alpine-pkg-glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk

RUN echo $' \n\
FROM docker.io/alpine \n\
RUN env \n\
ENTRYPOINT env ' >> /tmp/Dockerfile


ENTRYPOINT podman build -t test /tmp
