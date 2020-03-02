FROM openjdk:8-jdk-alpine

LABEL "com.github.actions.name"="sbt"
LABEL "com.github.actions.description"="Provides sbt commands"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

ENV SBT_VERSION 1.3.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN set -xe \
    && apk --no-cache --update add bash wget git \
    && mkdir -p "$SBT_HOME" \
    && wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" \ 
      | tar xz -C $SBT_HOME --strip-components=1 \
    && apk del wget \
    && sbt sbtVersion

ENTRYPOINT ["sbt"]
