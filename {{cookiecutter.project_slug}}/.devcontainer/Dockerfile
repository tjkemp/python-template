ARG IMAGE
ARG TAG
FROM ${IMAGE}:${TAG}

ARG USER
ARG USER_UID=1000

RUN useradd --uid ${USER_UID} \
    --user-group --create-home --shell /bin/bash ${USER}
