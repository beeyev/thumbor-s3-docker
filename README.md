# [Thumbor S3 Docker](https://github.com/beeyev/thumbor-s3-docker)  
> A Docker image for Thumbor with AWS S3 and Minio integration, designed for on-the-fly image cropping, resizing, applying filters, and image optimization.

<p align="center"><a href="https://github.com/beeyev/thumbor-s3-docker"><img src="https://github.com/beeyev/thumbor-s3-docker/raw/master/docs/img/thumbor-s3-docker.jpg"></a></p>

## A little of introduction
Thumbor S3 Docker is available in two variants of docker images, a lightweight (slim) - `slim-alpine` and a full-featured  - `debian`.

### All current docker images are packed with these features:
 - AWS S3 / Minio integration support
 - [`jpegtran`](https://thumbor.readthedocs.io/en/stable/jpegtran.html?highlight=Jpegtran#jpegtran) (already enabled) lossless jpeg optimizer which can make jpegs smaller by optimizing DCT coefficients.
 - [`gifsicle`](https://thumbor.readthedocs.io/en/stable/configuration.html?highlight=gifsicle#use-gifsicle-engine) allows to generate proper animated gifs, as well as static gifs with the smallest possible size.
 - [`thumbor-aws`](https://github.com/thumbor/thumbor-aws) Official extension for asynchronous non-blocking AWS S3 support.  
 - [`sentry-client`](https://thumbor.readthedocs.io/en/latest/custom_error_handling.html) Sentry error handling client.  
 - Support for Prometheus metrics collector.
 - Healthcheck inside the docker container is already configured, it controls that Thumbor service works properly.

### The full-featured (`debian`) version provides all possible functionality such as:  
 - [`gifv`](https://thumbor.readthedocs.io/en/stable/gifv.html) optimizer which is able to convert gifs to mp4 or webm videos, often resulting in dramatically smaller sized files.
 - [Facial Detection](https://thumbor.readthedocs.io/en/latest/detection_algorithms.html) support.
 - Ability to process SVG, AVIF and HEIF files.
 - [Lazy Detection](https://thumbor.readthedocs.io/en/latest/lazy_detection.html) functionality.
 - [`Image Metadata`](https://thumbor.readthedocs.io/en/stable/metadata.html) allows to work with image's metadata.  
- High Efficiency Image Format `avif`, `heif` support.  

> Before choosing the full-featured image version, make sure that you really need this extra functionality, as the resulting Docker container is three times larger than `slim-alpine`.

### Currently maintained docker images:  
`beeyev/thumbor-s3:debian`  
`beeyev/thumbor-s3:slim-alpine`  
`beeyev/thumbor-s3:7-debian`  
`beeyev/thumbor-s3:7-slim-alpine`  
`beeyev/thumbor-s3:7.7-debian`  
`beeyev/thumbor-s3:7.7-slim-alpine`
  
[Docker Hub](https://hub.docker.com/r/beeyev/thumbor-s3) | [Github packages](https://github.com/beeyev/thumbor-s3-docker/pkgs/container/thumbor-s3) | [Red Hat quay.io](https://quay.io/beeyev/thumbor-s3)  


## Configuring Thumbor S3
All the configuration can be done via environment variables. For a list of all the variables, please check [this config file](https://github.com/beeyev/thumbor-s3-docker/raw/master/docker/config/thumbor/thumbor.conf.tpl).  
Use variable names from the file as the environment variables to configure your docker container.
Besides the variables mentioned in the above config file, there are some additional environment variables:  
 - `PORT` - The port to run this Thumbor instance at. Default: `8888`
 - `LOG_LEVEL` - The log level to be used. Possible values are: `debug, info, warning, error, critical`. Default: `warning`
 - `NUM_PROCESSES` - Number of Thumbor processes to run. Possible values are: `0` - auto detect, `1` - no forks created, or set your number. Default: `0`

Also, don't forget to take a look at [the official documentation](https://thumbor.readthedocs.io/en/latest) on how to use Thumbor imaging.

### Securing thumbor
On production systems please consider the following options:

- `ALLOW_UNSAFE_URL` (default `False`): Disallow "unsafe" (non HMAC-signed) URLs [Docs](https://thumbor.readthedocs.io/en/latest/configuration.html#allow-unsafe-url)
- `SECURITY_KEY` (default `31337`): a shared secret for HMAC-signing URLs

Please check out [HMAC signing](https://thumbor.readthedocs.io/en/latest/security.html) in the docs for more information.

### Volume mapping
`/data:/data`

### Healthcheck
On production, you should enable a healthcheck to make sure, that your service is up and running. Luckily `thumbor` comes with a simple [healthcheck API built-in](https://thumbor.readthedocs.io/en/latest/configuration.html#healthcheck).

By default, it's `https//host:port/healthcheck/`.

## How to use this image
Please take a look at [**this example**](https://github.com/beeyev/thumbor-s3-docker/tree/master/examples/read-from-S3-cache-to-S3), it explains everything you need to know to begin working with Thumbor.

## Issues
Bug reports and feature requests can be submitted on the [Github Issue Tracker](https://github.com/beeyev/thumbor-s3-docker/issues).

## Credits
[Thumbor contributors](https://github.com/thumbor/thumbor/graphs/contributors)  

## License
The MIT License (MIT). Please see [License File](https://github.com/beeyev/thumbor-s3-docker/raw/master/LICENSE.md) for more information.

---
If you love this project, please consider giving me a ⭐

![](https://visitor-badge.laobi.icu/badge?page_id=beeyev.thumbor-s3-docker) [![Docker Pulls](https://img.shields.io/docker/pulls/beeyev/thumbor-s3)](https://hub.docker.com/r/beeyev/thumbor-s3)
