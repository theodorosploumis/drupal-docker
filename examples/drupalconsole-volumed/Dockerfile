FROM alpine

ARG CONSOLE_VERSION 1.0.0-alpha2

RUN wget https://github.com/hechoendrupal/DrupalConsole/releases/download/${CONSOLE_VERSION}/drupal.phar

RUN mkdir -p /drupalconole && \
    mv drupal.phar /drupalconsole/drupal && \
    chmod +x /drupalconsole/drupal

VOLUME /drupalconole

ENTRYPOINT ["/drupalconsole/drupal", "list"]
