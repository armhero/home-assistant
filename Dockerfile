FROM armhero/alpine:3.5
MAINTAINER Simon Erhardt <hello@rootlogin.ch>

ARG UID=1505
ARG GID=1505

RUN apk add --update \
  bash \
  python3 \
  tini \
  && rm -rf /var/cache/apk/*

RUN addgroup -g ${GID} hass \
  && adduser -u ${UID} -h /opt/hass -H -G hass -s /sbin/nologin -D hass

VOLUME ["/config"]

RUN pip3 install home-assistant

EXPOSE 8123

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["su", "-c", "hass --config /config", "hass"]
