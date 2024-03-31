# syntax=docker/dockerfile:1
# Alexander Tebiev - https://github.com/beeyev/thumbor-s3-docker
# Slim Thumbor docker image
# docker buildx build --cache-to=type=inline --build-arg=BUILD_DATE=0000 --build-arg=BUILD_FINGERPRINT=0000 --pull --tag thumbor-slim-alpine --file ./docker/thumbor-7.7/slim-alpine.Dockerfile ./ && docker run -it --rm thumbor-slim-alpine
FROM python:3.12-alpine

ENV TERM="xterm-256color" \
LANGUAGE="en_US.UTF-8" \
LANG="en_US.UTF-8" \
LC_TIME="en_DK.UTF-8" \
TIME_STYLE="long-iso"

ENV PYTHONUNBUFFERED=1 \
PYTHONDONTWRITEBYTECODE=1

# Enable jpegtran optimizer https://thumbor.readthedocs.io/en/latest/jpegtran.html#jpegtran
ENV OPTIMIZERS="['thumbor.optimizers.jpegtran']"

WORKDIR /app/

RUN set -eux \
    && apk update \
    && apk add --quiet --no-cache \
        bash \
        tzdata \
        nano \
        curl \
        iputils \
        tini \
        # jpegtran (libjpeg-turbo-utils) is a Thumbor requirement for optimizing JPEG images
        libjpeg-turbo-utils

RUN set -eux \
    && apk add --quiet --no-cache --virtual .build-deps \
    # thumbor requirements:
    curl-dev g++ \
    # Thumbor
    && pip install --quiet --no-cache-dir --upgrade pip \
    && pip install --quiet --no-cache-dir \
        # Jinja2 and envtpl are required to work with environtment variables
        Jinja2==3.1.* envtpl==0.7.* \
        # sentry is required for error tracking
        "sentry-sdk==1.*,>=1.39.1" \
        # numpy - https://github.com/beeyev/thumbor-s3-docker/pull/14
        "numpy==1.*,>=1.26.3" \
        # pycurl is required for thumbor
        "pycurl==7.*,>=7.45.2" thumbor==7.7.* thumbor-aws==0.8.* tc_prometheus==2.* \
    && thumbor --version && envtpl --help \
    ##
    ## Optional extensions
    ##
    ## `gifsicle` is a Thumbor requirement for better processing of GIF images
    && apk add --quiet --no-cache gifsicle \
    # Cleanup
    && apk del .build-deps

ARG TZ='UTC'
ENV TZ=$TZ

#These params meant to be set by CI
ARG BUILD_DATE=Undefined
ENV BUILD_DATE=$BUILD_DATE
RUN echo $BUILD_DATE
ARG BUILD_FINGERPRINT=Undefined
ENV BUILD_FINGERPRINT=$BUILD_FINGERPRINT
RUN echo $BUILD_FINGERPRINT

ENV LOG_LEVEL="warning"
ENV PORT="8888"
ENV NUM_PROCESSES=0

COPY ./docker/config/thumbor/thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY --chmod=0755 ./docker/config/etc/docker-entrypoint.sh /docker-entrypoint.sh

RUN set -eux \
    # /data/ dir is used by thumbor
    && mkdir /data/ \
    && mkdir /docker-entrypoint.init.d/ \
    && thumbor --version

# Enable nobody user
#RUN set -eux \
#    && chown -R nobody:nogroup /usr/local/etc/ /data/ /docker-entrypoint.init.d/
#USER nobody

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE ${PORT}
HEALTHCHECK --timeout=15s CMD curl --silent --fail http://127.0.0.1:${PORT}/healthcheck
