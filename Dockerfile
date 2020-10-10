FROM debian:stable-slim

ENV ZEN_VERSION=2.0.21-1
ENV ZEN_CHECKSUM=067500cb9275df911ab1b64562aca57eea3e96c88d256db804d995fd420e0359

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/ZencashOfficial/zen/releases/download/v${ZEN_VERSION}-bitcore/zen-${ZEN_VERSION}-bitcore-amd64.deb \
    && echo "${ZEN_CHECKSUM} zen-${ZEN_VERSION}-bitcore-amd64.deb" | sha256sum -c \
    && apt-get install -y ./zen-${ZEN_VERSION}-bitcore-amd64.deb
RUN zen-fetch-params

ENTRYPOINT ["zend"]