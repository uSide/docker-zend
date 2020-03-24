FROM debian:stable-slim

ENV ZEN_VERSION=2.0.20
ENV ZEN_CHECKSUM=fafb86ec230e7b702cae54bd8f4ec1ea210c3dd36691d5143f6b3de8609f02cc

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/ZencashOfficial/zen/releases/download/v${ZEN_VERSION}-bitcore/zen-${ZEN_VERSION}-bitcore-amd64.deb \
    && echo "${ZEN_CHECKSUM} zen-${ZEN_VERSION}-bitcore-amd64.deb" | sha256sum -c \
    && apt-get install -y ./zen-${ZEN_VERSION}-bitcore-amd64.deb
RUN zen-fetch-params

ENTRYPOINT ["zend"]
