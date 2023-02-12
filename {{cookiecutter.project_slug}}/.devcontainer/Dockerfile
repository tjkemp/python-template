ARG IMAGE
ARG TAG
FROM ${IMAGE}:${TAG}

ARG USER
ARG USER_UID=1000
ARG LOCALE
ARG TIMEZONE

RUN useradd --uid ${USER_UID} \
    --user-group --create-home --shell /bin/bash ${USER}

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/*

RUN localedef -i ${LOCALE} -c -f UTF-8 -A /usr/share/locale/locale.alias ${LOCALE}.UTF-8 \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

ENV LANG ${LOCALE}.utf8
