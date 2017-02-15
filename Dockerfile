FROM armhero/alpine:3.5
MAINTAINER Simon Erhardt <hello@rootlogin.ch>

ARG UID=1505
ARG GID=1505

COPY root /

RUN apk add --update \
  alpine-sdk \
  bash \
  ca-certificates \
  mariadb-client \
  mariadb-dev \
  nmap \
  python3 \
  tini \
  && addgroup -g ${GID} hass \
  && adduser -u ${UID} -h /opt/hass -H -G hass -s /bin/bash -D hass \
  && pip3 install homeassistant \
  && pip3 install mysqlclient \
  && apk del \
  alpine-sdk \
  mariadb-dev \
  && chmod +x /usr/local/bin/run-container.sh \
  && rm -rf /var/cache/apk/*

VOLUME ["/config"]

EXPOSE 8123

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/run-container.sh"]
