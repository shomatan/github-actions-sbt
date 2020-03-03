FROM openjdk:8-jdk-alpine

LABEL "com.github.actions.name"="sbt"
LABEL "com.github.actions.description"="Provides sbt commands"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN set -xe \
    && apk --no-cache --update add bash wget git \
    && mkdir -p "$SBT_HOME"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
