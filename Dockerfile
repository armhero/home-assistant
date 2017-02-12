FROM armhero/alpine:3.5
MAINTAINER Simon Erhardt <hello@rootlogin.ch>

ARG UID=1505
ARG GID=1505

COPY root /

RUN apk add --update \
  bash \
  ca-certificates \
  nmap \
  python3 \
  tini \
  && rm -rf /var/cache/apk/* \
  && addgroup -g ${GID} hass \
  && adduser -u ${UID} -h /opt/hass -H -G hass -s /bin/bash -D hass \
  && pip3 install homeassistant \
  && chmod +x /usr/local/bin/run-container.sh

VOLUME ["/config"]

EXPOSE 8123

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/run-container.sh"]
