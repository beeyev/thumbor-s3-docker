# [Thumbor S3 Docker](https://github.com/beeyev/thumbor-s3-docker)  
> A docker image for Thumbor with AWS S3 / Minio integration for cropping, resizing, applying filters and optimizing images on the fly.

<p align="center"><a href="https://github.com/beeyev/thumbor-s3-docker"><img src="https://github.com/beeyev/thumbor-s3-docker/raw/master/docs/img/thumbor-s3-docker.jpg"></a></p>

## A little of introduction
Thumbor S3 Docker is available in two variants of docker images, lightweight (slim) - `slim-alpine` and full-featured  - `alpine`.

### All current docker images are packed with these features:
 - AWS S3 / Minio integration support
 - [`jpegtran`](https://thumbor.readthedocs.io/en/stable/jpegtran.html?highlight=Jpegtran#jpegtran) (already enabled) lossless jpeg optimizer which can make jpegs smaller by optimizing DCT coefficients.
 - [`gifsicle`](https://thumbor.readthedocs.io/en/stable/configuration.html?highlight=gifsicle#use-gifsicle-engine) allows to generate proper animated gifs, as well as static gifs with the smallest possible size.
 - [`thumbor-aws`](https://github.com/thumbor/thumbor-aws) Official extension for asynchronous non-blocking AWS S3 support.  
 - Support for Prometheus metrics collector.
 - Healthcheck inside the docker container is already configured, it controls that Thumbor service works properly.

### The full-featured (`alpine`) version contains these extra functionality:  
 - [`gifv`](https://thumbor.readthedocs.io/en/stable/gifv.html) optimizer which is able to convert gifs to mp4 or webm videos, often resulting in dramatically smaller sized files.
 - Ability to process SVG files.
 - [`Image Metadata`](https://thumbor.readthedocs.io/en/stable/metadata.html) allows to work with image's metadata.

> Before choosing the full-featured image version, make sure that you really need these extra functionality, since the resulting docker container is two times bigger than `slim-alpine`

### Currently maintained docker images:  
`thumbor-s3:7.1-alpine`  
`thumbor-s3:7.1-slim-alpine`
  
[Docker Hub](https://hub.docker.com/r/beeyev/thumbor-s3) | [Github packages](https://github.com/beeyev/thumbor-s3-docker/pkgs/container/thumbor-s3)  


## Configuring Thumbor S3
All the configuration can be done via environment variables. For a list of all the variables, please check [this config file](https://github.com/beeyev/thumbor-s3-docker/raw/master/docker/config/thumbor/thumbor.conf.tpl).  
Use variable names from the file as the environment variables to configure your docker container. 
Apart from variables in the config file mentioned above, there are some extra environment variables:  
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

By default, it's `https//host:port/healthcheck/`. You can change it with the `HEALTHCHECK_ROUTE` environment variable.

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

![](https://visitor-badge.laobi.icu/badge?page_id=beeyev.thumbor-s3-docker)
