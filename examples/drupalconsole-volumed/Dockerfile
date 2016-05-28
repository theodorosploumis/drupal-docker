#docker build --build-arg CONSOLE_VERSION=1.0.0-alpha2 -t drupalconsole-volumed:1.0.0-alpha2 .
FROM radial/busyboxplus:curl

MAINTAINER Theodoros Ploumis <me@theodorosploumis.com>

ARG CONSOLE_VERSION

RUN mkdir -p /drupalconsole

WORKDIR /drupalconsole

RUN curl -L -o drupal https://github.com/hechoendrupal/DrupalConsole/releases/download/${CONSOLE_VERSION}/drupal.phar && \
    chmod +x /drupalconsole/drupal

VOLUME /drupalconsole

ENTRYPOINT ["/drupalconsole/drupal"]
