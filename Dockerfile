FROM ubuntu:latest

ARG USER=1001
ARG S2IDIR="/home/s2i"
ARG APPDIR="/deployments"

LABEL maintainer="Huseyin Akdogan <hakdogan@kodcu.com>" \
      io.k8s.description="S2I builder for Java Applications." \
      io.k8s.display-name="KODCU JDK Provider" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java" \
      io.openshift.s2i.scripts-url="image:///home/s2i/bin"

COPY install.sh "$APPDIR/"
COPY s2i $S2IDIR
RUN chmod 777 -R $S2IDIR

RUN useradd $USER \
    && chown $USER:$USER $APPDIR \
    && addgroup $USER $USER \
    && chmod 777 -R $APPDIR

WORKDIR $APPDIR

EXPOSE 8080

RUN apt-get update -y && \
    apt-get install -y software-properties-common

RUN ["/bin/bash", "-c", "$APPDIR/install.sh"]

RUN apt-get install maven -y && \
    rm -rf /var/lib/apt/lists/*

USER $USER

CMD ["/home/s2i/bin/run"]
