#docker build --build-arg DRUSH_VERSION=8.1.2 -t drush-volumed:8.1.2 .
FROM radial/busyboxplus:curl

MAINTAINER Theodoros Ploumis <me@theodorosploumis.com>

ARG DRUSH_VERSION

RUN mkdir /drush

WORKDIR /drush

RUN curl -L -o drush https://github.com/drush-ops/drush/releases/download/${DRUSH_VERSION}/drush.phar && \
    chmod +x /drush/drush

VOLUME /drush

#CMD ["/drush/drush"]
