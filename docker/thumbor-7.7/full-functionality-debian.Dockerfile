# syntax=docker/dockerfile:1
# Alexander Tebiev - https://github.com/beeyev/thumbor-s3-docker
# Full-featured Thumbor docker image
# docker buildx build --cache-to=type=inline --build-arg=BUILD_DATE=0000 --build-arg=BUILD_FINGERPRINT=0000 --pull --tag thumbor-all-debian --file ./docker/thumbor-7.7/full-functionality-debian.Dockerfile ./ && docker run -it --rm thumbor-all-debian
FROM python:3.12-slim-bullseye

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
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        bash \
        tzdata \
        nano \
        iputils-ping \
        curl \
        tini \
        ## jpegtran (libjpeg-turbo-progs) is for optimizing JPEG images
        libjpeg-turbo-progs \
        ## `ffmpeg` is for rendering animated images as GIFV
        ffmpeg \
        ## `gifsicle` is for better processing of GIF images
        gifsicle \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -eux \
    # Thumbor
    && pip install --quiet --no-cache-dir --upgrade pip \
    && pip install --quiet --no-cache-dir \
        # Jinja2 and envtpl are required to work with environtment variables
        Jinja2==3.1.* envtpl==0.7.* \
        # sentry is required for error tracking
        "sentry-sdk==1.*,>=1.39.1" \
        # Queued Redis Detector
        "redis==5.*,>=5.0.1" \
        # remotecv is required for queued OpenCV processing
        "remotecv==5.*,>=5.1.8"  \
        # thumbor
        thumbor[all]==7.7.* thumbor-aws==0.8.* tc_prometheus==2.* \
        && thumbor --version && envtpl --help

LABEL org.opencontainers.image.title="Thumbor S3" \
    org.opencontainers.image.description="Docker image for Thumbor with AWS S3 and Minio integration" \
    org.opencontainers.image.authors="https://github.com/beeyev/" \
    org.opencontainers.image.vendor="ThumborS3" \
    org.opencontainers.image.documentation="https://github.com/beeyev/thumbor-s3-docker" \
    org.opencontainers.image.url="https://github.com/beeyev/thumbor-s3-docker" \
    org.opencontainers.image.source="https://github.com/beeyev/thumbor-s3-docker"

ARG TZ='UTC'
ENV TZ=$TZ

#These params meant to be set by CI
ARG BUILD_DATE=undefined
ENV BUILD_DATE=$BUILD_DATE
RUN echo $BUILD_DATE
ARG BUILD_FINGERPRINT=undefined
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
    # Running `thumbor-doctor` to smoke test functionality
    && thumbor-doctor

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE ${PORT}
HEALTHCHECK --timeout=15s CMD curl --silent --fail http://127.0.0.1:${PORT}/healthcheck
