################################### Logging ####################################

## Logging configuration as json
## Defaults to: None
{% if THUMBOR_LOG_CONFIG is defined %}
THUMBOR_LOG_CONFIG = '{{ THUMBOR_LOG_CONFIG }}'
{% endif %}

## Log Format to be used by thumbor when writing log messages.
## Defaults to: %(asctime)s %(name)s:%(levelname)s %(message)s
{% if THUMBOR_LOG_FORMAT is defined %}
THUMBOR_LOG_FORMAT = '{{ THUMBOR_LOG_FORMAT }}'
{% endif %}


## Date Format to be used by thumbor when writing log messages.
## Defaults to: %Y-%m-%d %H:%M:%S
{% if THUMBOR_LOG_DATE_FORMAT is defined %}
THUMBOR_LOG_DATE_FORMAT = '{{ THUMBOR_LOG_DATE_FORMAT }}'
{% endif %}

################################################################################


################################### Imaging ####################################

## Max width in pixels for images read or generated by thumbor
## Defaults to: 0
{% if MAX_WIDTH is defined %}
MAX_WIDTH = {{ MAX_WIDTH }}
{% endif %}

## Max height in pixels for images read or generated by thumbor
## Defaults to: 0
{% if MAX_HEIGHT is defined %}
MAX_HEIGHT = {{ MAX_HEIGHT }}
{% endif %}

## Max pixel count for images read by thumbor. Set to prevent decompression bomb DOS attack.
## Defaults to: 75000000.0
{% if MAX_PIXELS is defined %}
MAX_PIXELS = {{ MAX_PIXELS }}
{% endif %}

## Min width in pixels for images read or generated by thumbor
## Defaults to: 1
{% if MIN_WIDTH is defined %}
MIN_WIDTH = {{ MIN_WIDTH }}
{% endif %}

## Min width in pixels for images read or generated by thumbor
## Defaults to: 1
{% if MIN_HEIGHT is defined %}
MIN_HEIGHT = {{ MIN_HEIGHT }}
{% endif %}

## Allowed domains for the http loader to download. These are regular
## expressions.
## Defaults to: []
{% if ALLOWED_SOURCES is defined %}
ALLOWED_SOURCES = {{ ALLOWED_SOURCES }}
{% endif %}

## Quality index used for generated JPEG images
## Defaults to: 80
{% if QUALITY is defined %}
QUALITY = {{ QUALITY }}
{% endif %}

## Exports JPEG images with the progressive flag set.
## Defaults to: True
{% if PROGRESSIVE_JPEG is defined %}
PROGRESSIVE_JPEG = {{ PROGRESSIVE_JPEG }}
{% endif %}

## Specify subsampling behavior for Pillow (see `subsampling`               in
## http://pillow.readthedocs.org/en/latest/handbook/image-file-formats.html#jpeg).
## Be careful to use int for 0,1,2 and string for "4:4:4"
## notation. Will ignore `quality`. Using `keep` will copy the original file's
## subsampling.
## Defaults to: None
{% if PILLOW_JPEG_SUBSAMPLING is defined %}
PILLOW_JPEG_SUBSAMPLING = '{{ PILLOW_JPEG_SUBSAMPLING }}'
{% endif %}


## Specify quantization tables for Pillow (see `qtables`               in
## http://pillow.readthedocs.org/en/latest/handbook/image-file-
## formats.html#jpeg). Will ignore `quality`. Using `keep` will copy the
## original file's qtables.
## Defaults to: None
{% if PILLOW_JPEG_QTABLES is defined %}
PILLOW_JPEG_QTABLES = '{{ PILLOW_JPEG_QTABLES }}'
{% endif %}


## Specify resampling filter for Pillow resize method.One of LANCZOS, NEAREST,
## BILINEAR, BICUBIC, HAMMING (Pillow>=3.4.0).
## Defaults to: 'LANCZOS'
{% if PILLOW_RESAMPLING_FILTER is defined %}
PILLOW_RESAMPLING_FILTER = '{{ PILLOW_RESAMPLING_FILTER }}'
{% endif %}

## Quality index used for generated WebP images. If not set (None) the same level
## of JPEG quality will be used. If 100 the `lossless` flag will be used.
## Defaults to: None
{% if WEBP_QUALITY is defined %}
WEBP_QUALITY = {{ WEBP_QUALITY }}
{% endif %}

## Compression level for generated PNG images.
## Defaults to: 6
{% if PNG_COMPRESSION_LEVEL is defined %}
PNG_COMPRESSION_LEVEL = {{ PNG_COMPRESSION_LEVEL }}
{% endif %}

## Indicates if final image should preserve indexed mode (P or 1) of original
## image
## Defaults to: True
{% if PILLOW_PRESERVE_INDEXED_MODE is defined %}
PILLOW_PRESERVE_INDEXED_MODE = {{ PILLOW_PRESERVE_INDEXED_MODE }}
{% endif %}

## Specifies whether WebP format should be used automatically if the request
## accepts it (via Accept header)
## Defaults to: False
{% if AUTO_WEBP is defined %}
AUTO_WEBP = {{ AUTO_WEBP }}
{% endif %}

## Specifies whether a PNG image should be used automatically if the png image
## has no transparency (via alpha layer). WARNING: Depending on case, this is
## not a good deal. This transformation maybe causes distortions or the size
## of image can increase. Images with texts, for example, the result image
## maybe will be distorted. Dark images, for example, the size of result image
## maybe will be bigger. You have to evaluate the majority of your use cases
## to take a decision about the usage of this conf.
## Defaults to: False
{% if AUTO_PNG_TO_JPG is defined %}
AUTO_PNG_TO_JPG = {{ AUTO_PNG_TO_JPG }}
{% endif %}

## Specify the ratio between 1in and 1px for SVG images. This is only used
## whenrasterizing SVG images having their size units in cm or inches.
## Defaults to: 150
{% if SVG_DPI is defined %}
SVG_DPI = {{ SVG_DPI }}
{% endif %}

## Max AGE sent as a header for the image served by thumbor in seconds
## Defaults to: 86400
{% if MAX_AGE is defined %}
MAX_AGE = {{ MAX_AGE }}
{% endif %}

## Indicates the Max AGE header in seconds for temporary images (images with
## failed smart detection)
## Defaults to: 0
{% if MAX_AGE_TEMP_IMAGE is defined %}
MAX_AGE_TEMP_IMAGE = {{ MAX_AGE_TEMP_IMAGE }}
{% endif %}

## Indicates whether thumbor should rotate images that have an Orientation EXIF
## header
## Defaults to: False
{% if RESPECT_ORIENTATION is defined %}
RESPECT_ORIENTATION = {{ RESPECT_ORIENTATION }}
{% endif %}

## Ignore errors during smart detections and return image as a temp image (not
## saved in result storage and with MAX_AGE_TEMP_IMAGE age)
## Defaults to: False
{% if IGNORE_SMART_ERRORS is defined %}
IGNORE_SMART_ERRORS = {{ IGNORE_SMART_ERRORS }}
{% endif %}

## Sends If-Modified-Since & Last-Modified headers; requires support from result
## storage
## Defaults to: False
{% if SEND_IF_MODIFIED_LAST_MODIFIED_HEADERS is defined %}
SEND_IF_MODIFIED_LAST_MODIFIED_HEADERS = {{ SEND_IF_MODIFIED_LAST_MODIFIED_HEADERS }}
{% endif %}

## Preserves exif information in generated images. Increases image size in
## kbytes, use with caution.
## Defaults to: False
{% if PRESERVE_EXIF_INFO is defined %}
PRESERVE_EXIF_INFO = {{ PRESERVE_EXIF_INFO }}
{% endif %}

## Indicates whether thumbor should enable the EXPERIMENTAL support for animated
## gifs.
## Defaults to: True
{% if ALLOW_ANIMATED_GIFS is defined %}
ALLOW_ANIMATED_GIFS = {{ ALLOW_ANIMATED_GIFS }}
{% endif %}

## Indicates whether thumbor should use gifsicle engine. Please note that smart
## cropping and filters are not supported for gifs using gifsicle (but won't
## give an error).
## Defaults to: False
{% if USE_GIFSICLE_ENGINE is defined %}
USE_GIFSICLE_ENGINE = {{ USE_GIFSICLE_ENGINE }}
{% endif %}

## Indicates whether thumbor should enable blacklist functionality to prevent
## processing certain images.
## Defaults to: False
{% if USE_BLACKLIST is defined %}
USE_BLACKLIST = {{ USE_BLACKLIST }}
{% endif %}

## Size of the thread pool used for image transformations.  The default value is
## 0 (don't use a threadpoool. Increase this if you are seeing your IOLoop
## getting blocked (often indicated by your upstream HTTP requests timing out)
## Defaults to: 0
{% if ENGINE_THREADPOOL_SIZE is defined %}
ENGINE_THREADPOOL_SIZE = {{ ENGINE_THREADPOOL_SIZE }}
{% endif %}


################################################################################


################################ Extensibility #################################

## The metrics backend thumbor should use to measure internal actions. This must
## be the full name of a python module (python must be able to import it)
## Defaults to: 'thumbor.metrics.logger_metrics'
{% if METRICS is defined %}
METRICS = '{{ METRICS }}'
{% endif %}

## The loader thumbor should use to load the original image. This must be the
## full name of a python module (python must be able to import it)
## Defaults to: 'thumbor.loaders.http_loader'
{% if LOADER is defined %}
LOADER = '{{ LOADER }}'
{% endif %}

## The file storage thumbor should use to store original images. This must be the
## full name of a python module (python must be able to import it)
## Defaults to: 'thumbor.storages.file_storage'
{% if STORAGE is defined %}
STORAGE = '{{ STORAGE }}'
{% endif %}

## The result storage thumbor should use to store generated images. This must be
## the full name of a python module (python must be able to import it)
## Defaults to: None
{% if RESULT_STORAGE is defined %}
RESULT_STORAGE = '{{ RESULT_STORAGE }}'
{% endif %}

## The imaging engine thumbor should use to perform image operations. This must
## be the full name of a python module (python must be able to import it)
## Possible values: 'thumbor.engines.pil', 'thumbor.engines.opencv'
## Defaults to: 'thumbor.engines.pil'
{% if ENGINE is defined %}
ENGINE = '{{ ENGINE }}'
{% endif %}

## The gif engine thumbor should use to perform image operations. This must be
## the full name of a python module (python must be able to import it)
## Defaults to: 'thumbor.engines.gif'
{% if GIF_ENGINE is defined %}
GIF_ENGINE = '{{ GIF_ENGINE }}'
{% endif %}

## The url signer thumbor should use to verify url signatures.This must be the
## full name of a python module (python must be able to import it)
## Defaults to: 'libthumbor.url_signers.base64_hmac_sha1'
{% if URL_SIGNER is defined %}
URL_SIGNER = '{{ URL_SIGNER }}'
{% endif %}

## Preserves Jpeg IPTC information in generated images.
## More info: https://github.com/thumbor/thumbor/pull/1555
PRESERVE_IPTC_INFO = {{ PRESERVE_IPTC_INFO | default(False) }}

################################################################################


################################### Security ###################################

## The security key thumbor uses to sign image URLs
## Defaults to: 'MY_SECURE_KEY'
SECURITY_KEY = '{{ SECURITY_KEY | default('31337') }}'

## Indicates if the /unsafe URL should be available
## Defaults to: True
ALLOW_UNSAFE_URL = {{ ALLOW_UNSAFE_URL | default(False) }}

################################################################################

##################################### HTTP #####################################

## Enables automatically generated etags
## Defaults to: True
{% if ENABLE_ETAGS is defined %}
ENABLE_ETAGS = {{ ENABLE_ETAGS }}
{% endif %}

################################################################################


################################### Storage ####################################

## Set maximum id length for images when stored
## Defaults to: 32
{% if MAX_ID_LENGTH is defined %}
MAX_ID_LENGTH = {{ MAX_ID_LENGTH }}
{% endif %}

################################################################################


################################# Performance ##################################

## Set garbage collection interval in seconds
## Defaults to: None
{% if GC_INTERVAL is defined %}
GC_INTERVAL = {{ GC_INTERVAL }}
{% endif %}

################################################################################


################################# Healthcheck ##################################

## Do not change this variable since the default parameter is used in docker healthcheck
## Defaults to: '/healthcheck/?'
#HEALTHCHECK_ROUTE = '/healthcheck/?'

################################################################################


################################### Metrics ####################################

## Host to send statsd instrumentation to
## Defaults to: None
{% if STATSD_HOST is defined %}
STATSD_HOST = '{{ STATSD_HOST }}'
{% endif %}

## Port to send statsd instrumentation to
## Defaults to: 8125
{% if STATSD_PORT is defined %}
STATSD_PORT = {{ STATSD_PORT }}
{% endif %}

## Prefix for statsd
## Defaults to: None
{% if STATSD_PREFIX is defined %}
STATSD_PREFIX = '{{ STATSD_PREFIX }}'
{% endif %}

################################################################################

################################# File Loader ##################################

## The root path where the File Loader will try to find images
## Defaults to: /tmp
FILE_LOADER_ROOT_PATH = '{{ FILE_LOADER_ROOT_PATH | default('/data/loader') }}'

################################################################################


################################# HTTP Loader ##################################

## The maximum number of seconds libcurl can take to connect to an image being
## loaded
## Defaults to: 5
{% if HTTP_LOADER_CONNECT_TIMEOUT is defined %}
HTTP_LOADER_CONNECT_TIMEOUT = {{ HTTP_LOADER_CONNECT_TIMEOUT }}
{% endif %}

## The maximum number of seconds libcurl can take to download an image
## Defaults to: 20
{% if HTTP_LOADER_REQUEST_TIMEOUT is defined %}
HTTP_LOADER_REQUEST_TIMEOUT = {{ HTTP_LOADER_REQUEST_TIMEOUT }}
{% endif %}

## Indicates whether libcurl should follow redirects when downloading an image
## Defaults to: True
{% if HTTP_LOADER_FOLLOW_REDIRECTS is defined %}
HTTP_LOADER_FOLLOW_REDIRECTS = {{ HTTP_LOADER_FOLLOW_REDIRECTS }}
{% endif %}

## Indicates the number of redirects libcurl should follow when downloading an
## image
## Defaults to: 5
{% if HTTP_LOADER_MAX_REDIRECTS is defined %}
HTTP_LOADER_MAX_REDIRECTS = {{ HTTP_LOADER_MAX_REDIRECTS }}
{% endif %}

## The maximum number of simultaneous HTTP connections the loader can make before
## queuing
## Defaults to: 10
{% if HTTP_LOADER_MAX_CLIENTS is defined %}
HTTP_LOADER_MAX_CLIENTS = {{ HTTP_LOADER_MAX_CLIENTS }}
{% endif %}

## Indicates whether thumbor should forward the user agent of the requesting user
## Defaults to: False
{% if HTTP_LOADER_FORWARD_USER_AGENT is defined %}
HTTP_LOADER_FORWARD_USER_AGENT = {{ HTTP_LOADER_FORWARD_USER_AGENT }}
{% endif %}

## Indicates whether thumbor should forward the headers of the request
## Defaults to: False
{% if HTTP_LOADER_FORWARD_ALL_HEADERS is defined %}
HTTP_LOADER_FORWARD_ALL_HEADERS = {{ HTTP_LOADER_FORWARD_ALL_HEADERS }}
{% endif %}

## Indicates which headers should be forwarded among all the headers of the request
## Defaults to: []
{% if HTTP_LOADER_FORWARD_HEADERS_WHITELIST is defined %}
HTTP_LOADER_FORWARD_HEADERS_WHITELIST = {{ HTTP_LOADER_FORWARD_HEADERS_WHITELIST }}
{% endif %}

## Default user agent for thumbor http loader requests
## Defaults to: 'Thumbor/7.7'
{% if HTTP_LOADER_DEFAULT_USER_AGENT is defined %}
HTTP_LOADER_DEFAULT_USER_AGENT = '{{ HTTP_LOADER_DEFAULT_USER_AGENT }}'
{% endif %}

## The proxy host needed to load images through
## Defaults to: None
{% if HTTP_LOADER_PROXY_HOST is defined %}
HTTP_LOADER_PROXY_HOST = '{{ HTTP_LOADER_PROXY_HOST }}'
{% endif %}

## The proxy port for the proxy host
## Defaults to: None
{% if HTTP_LOADER_PROXY_PORT is defined %}
HTTP_LOADER_PROXY_PORT = {{ HTTP_LOADER_PROXY_PORT }}
{% endif %}

## The proxy username for the proxy host
## Defaults to: None
{% if HTTP_LOADER_PROXY_USERNAME is defined %}
HTTP_LOADER_PROXY_USERNAME = '{{ HTTP_LOADER_PROXY_USERNAME }}'
{% endif %}

## The proxy password for the proxy host
## Defaults to: None
{% if HTTP_LOADER_PROXY_PASSWORD is defined %}
HTTP_LOADER_PROXY_PASSWORD = '{{ HTTP_LOADER_PROXY_PASSWORD }}'
{% endif %}

## The filename of CA certificates in PEM format
## Defaults to: None
{% if HTTP_LOADER_CA_CERTS is defined %}
HTTP_LOADER_CA_CERTS = '{{ HTTP_LOADER_CA_CERTS }}'
{% endif %}

## Validate the server’s certificate for HTTPS requests
## Defaults to: None
{% if HTTP_LOADER_VALIDATE_CERTS is defined %}
HTTP_LOADER_VALIDATE_CERTS = '{{ HTTP_LOADER_VALIDATE_CERTS }}'
{% endif %}

## The filename for client SSL key
## Defaults to: None
{% if HTTP_LOADER_CLIENT_KEY is defined %}
HTTP_LOADER_CLIENT_KEY = '{{ HTTP_LOADER_CLIENT_KEY }}'
{% endif %}

## The filename for client SSL certificate
## Defaults to: None
{% if HTTP_LOADER_CLIENT_CERT is defined %}
HTTP_LOADER_CLIENT_CERT = '{{ HTTP_LOADER_CLIENT_CERT }}'
{% endif %}

## If the CurlAsyncHTTPClient should be used
## Defaults to: False
{% if HTTP_LOADER_CURL_ASYNC_HTTP_CLIENT is defined %}
HTTP_LOADER_CURL_ASYNC_HTTP_CLIENT = {{ HTTP_LOADER_CURL_ASYNC_HTTP_CLIENT }}
{% endif %}

################################################################################


################################### General ####################################

## If HTTP_LOADER_CURL_LOW_SPEED_LIMIT and HTTP_LOADER_CURL_ASYNC_HTTP_CLIENT are
## set, then this is the time in seconds as integer after a download should
## timeout if the speed is below HTTP_LOADER_CURL_LOW_SPEED_LIMIT for that
## long
## Defaults to: 0
{% if HTTP_LOADER_CURL_LOW_SPEED_TIME is defined %}
HTTP_LOADER_CURL_LOW_SPEED_TIME = {{ HTTP_LOADER_CURL_LOW_SPEED_TIME }}
{% endif %}

## If HTTP_LOADER_CURL_LOW_SPEED_TIME and HTTP_LOADER_CURL_ASYNC_HTTP_CLIENT are
## set, then this is the limit in bytes per second as integer which should
## timeout if the speed is below that limit for
## HTTP_LOADER_CURL_LOW_SPEED_TIME seconds
## Defaults to: 0
{% if HTTP_LOADER_CURL_LOW_SPEED_LIMIT is defined %}
HTTP_LOADER_CURL_LOW_SPEED_LIMIT = {{ HTTP_LOADER_CURL_LOW_SPEED_LIMIT }}
{% endif %}

## Custom app class to override ThumborServiceApp. This config value is
## overridden by the -a command-line parameter.
## Defaults to: 'thumbor.app.ThumborServiceApp'
{% if APP_CLASS is defined %}
APP_CLASS = '{{ APP_CLASS }}'
{% endif %}

################################################################################


################################# File Storage #################################

## Expiration in seconds for the images in the File Storage. Defaults to one
## month
## Defaults to: 2592000
{% if STORAGE_EXPIRATION_SECONDS is defined %}
STORAGE_EXPIRATION_SECONDS = {{ STORAGE_EXPIRATION_SECONDS }}
{% endif %}

## Indicates whether thumbor should store the signing key for each image in the
## file storage. This allows the key to be changed and old images to still be
## properly found
## Defaults to: False
{% if STORES_CRYPTO_KEY_FOR_EACH_IMAGE is defined %}
STORES_CRYPTO_KEY_FOR_EACH_IMAGE = {{ STORES_CRYPTO_KEY_FOR_EACH_IMAGE }}
{% endif %}

## The root path where the File Storage will try to find images
## Defaults to: '/tmp/thumbor/storage'
FILE_STORAGE_ROOT_PATH = '{{ FILE_STORAGE_ROOT_PATH | default('/data/storage') }}'

################################################################################


#################################### Upload ####################################

## Max size in bytes for images uploaded to thumbor
## Aliases: MAX_SIZE
## Defaults to: 0
{% if UPLOAD_MAX_SIZE is defined %}
UPLOAD_MAX_SIZE = {{ UPLOAD_MAX_SIZE }}
{% endif %}

## Indicates whether thumbor should enable File uploads
## Aliases: ENABLE_ORIGINAL_PHOTO_UPLOAD
## Defaults to: False
{% if UPLOAD_ENABLED is defined %}
UPLOAD_ENABLED = {{ UPLOAD_ENABLED }}
{% endif %}

## The type of storage to store uploaded images with
## Aliases: ORIGINAL_PHOTO_STORAGE
## Defaults to: 'thumbor.storages.file_storage'
{% if UPLOAD_PHOTO_STORAGE is defined %}
UPLOAD_PHOTO_STORAGE = '{{ UPLOAD_PHOTO_STORAGE }}'
{% endif %}

## Indicates whether image deletion should be allowed
## Aliases: ALLOW_ORIGINAL_PHOTO_DELETION
## Defaults to: False
{% if UPLOAD_DELETE_ALLOWED is defined %}
UPLOAD_DELETE_ALLOWED = {{ UPLOAD_DELETE_ALLOWED }}
{% endif %}

## Indicates whether image overwrite should be allowed
## Aliases: ALLOW_ORIGINAL_PHOTO_PUTTING
## Defaults to: False
{% if UPLOAD_PUT_ALLOWED is defined %}
UPLOAD_PUT_ALLOWED = {{ UPLOAD_PUT_ALLOWED }}
{% endif %}

## Default filename for image uploaded
## Defaults to: 'image'
{% if UPLOAD_DEFAULT_FILENAME is defined %}
UPLOAD_DEFAULT_FILENAME = '{{ UPLOAD_DEFAULT_FILENAME }}'
{% endif %}

################################################################################


################################# Mixed Storage #################################

## Mixed Storage file storage. This must be the full name of a python module
## (python must be able to import it)
## Defaults to: 'thumbor.storages.no_storage'
{% if MIXED_STORAGE_FILE_STORAGE is defined %}
MIXED_STORAGE_FILE_STORAGE = '{{ MIXED_STORAGE_FILE_STORAGE }}'
{% endif %}

## Mixed Storage signing key storage. This must be the full name of a python
## module (python must be able to import it)
## Defaults to: 'thumbor.storages.no_storage'
{% if MIXED_STORAGE_CRYPTO_STORAGE is defined %}
MIXED_STORAGE_CRYPTO_STORAGE = '{{ MIXED_STORAGE_CRYPTO_STORAGE }}'
{% endif %}

## Mixed Storage detector information storage. This must be the full name of a
## python module (python must be able to import it)
## Defaults to: 'thumbor.storages.no_storage'
{% if MIXED_STORAGE_DETECTOR_STORAGE is defined %}
MIXED_STORAGE_DETECTOR_STORAGE = '{{ MIXED_STORAGE_DETECTOR_STORAGE }}'
{% endif %}

################################################################################


##################################### Meta #####################################

## The callback function name that should be used by the META route for JSONP
## access
## Defaults to: None
{% if META_CALLBACK_NAME is defined %}
META_CALLBACK_NAME = '{{ META_CALLBACK_NAME }}'
{% endif %}

################################################################################


################################### Detection ###################################

## List of detectors that thumbor should use to find faces and/or features. All
## of them must be full names of python modules (python must be able to import
## it)
## Defaults to: []
#DETECTORS =  [
#'thumbor.detectors.queued_detector.queued_complete_detector',
#'thumbor.detectors.queued_detector.queued_face_detector',
#'thumbor.detectors.queued_detector.queued_feature_detector',
#'thumbor.detectors.feature_detector',
#'thumbor.detectors.face_detector',
#]
{% if DETECTORS is defined %}
DETECTORS = {{ DETECTORS }}
{% endif %}

## The cascade file that opencv will use to detect faces.
## Defaults to: 'haarcascade_frontalface_alt.xml'
{% if FACE_DETECTOR_CASCADE_FILE is defined %}
FACE_DETECTOR_CASCADE_FILE = '{{ FACE_DETECTOR_CASCADE_FILE }}'
{% endif %}

## The cascade file that opencv will use to detect glasses.
## Defaults to: 'haarcascade_eye_tree_eyeglasses.xml'
{% if GLASSES_DETECTOR_CASCADE_FILE is defined %}
GLASSES_DETECTOR_CASCADE_FILE = '{{ GLASSES_DETECTOR_CASCADE_FILE }}'
{% endif %}

## The cascade file that opencv will use to detect profile faces.
## Defaults to: 'haarcascade_profileface.xml'
{% if PROFILE_DETECTOR_CASCADE_FILE is defined %}
PROFILE_DETECTOR_CASCADE_FILE = '{{ PROFILE_DETECTOR_CASCADE_FILE }}'
{% endif %}

################################################################################


################################## Optimizers ##################################

## List of optimizers that thumbor will use to optimize images
## Defaults to: [] --> ['thumbor.optimizers.jpegtran',]
{% if OPTIMIZERS is defined %}
OPTIMIZERS = {{ OPTIMIZERS }}
{% endif %}

## Path for the jpegtran binary
## Defaults to: '/usr/bin/jpegtran'
JPEGTRAN_PATH = '{{ JPEGTRAN_PATH | default('/usr/bin/jpegtran') }}'

## Path for the progressive scans file to use with jpegtran optimizer. Implies
## progressive jpeg output
## Defaults to: ''
{% if JPEGTRAN_SCANS_FILE is defined %}
JPEGTRAN_SCANS_FILE = '{{ JPEGTRAN_SCANS_FILE }}'
{% endif %}

## Path for the ffmpeg binary used to generate gifv(h.264)
## Defaults to: '/usr/local/bin/ffmpeg'
FFMPEG_PATH = '{{ FFMPEG_PATH  | default('/usr/bin/ffmpeg') }}' # Default path for the docker installation in debian

################################################################################


################################### Filters ####################################

## List of filters that thumbor will allow to be used in generated images. All of
## them must be full names of python modules (python must be able to import
## it)
## Defaults to: [
#    'thumbor.filters.brightness',
#    'thumbor.filters.colorize',
#    'thumbor.filters.contrast',
#    'thumbor.filters.rgb',
#    'thumbor.filters.round_corner',
#    'thumbor.filters.quality',
#    'thumbor.filters.noise',
#    'thumbor.filters.watermark',
#    'thumbor.filters.equalize',
#    'thumbor.filters.fill',
#    'thumbor.filters.sharpen',
#    'thumbor.filters.strip_exif',
#    'thumbor.filters.strip_icc',
#    'thumbor.filters.frame',
#    'thumbor.filters.grayscale',
#    'thumbor.filters.rotate',
#    'thumbor.filters.format',
#    'thumbor.filters.max_bytes',
#    'thumbor.filters.convolution',
#    'thumbor.filters.blur',
#    'thumbor.filters.extract_focal',
#    'thumbor.filters.focal',
#    'thumbor.filters.no_upscale',
#    'thumbor.filters.saturation',
#    'thumbor.filters.max_age',
#    'thumbor.filters.curve',
#    'thumbor.filters.background_color',
#    'thumbor.filters.upscale',
#    'thumbor.filters.proportion',
#    'thumbor.filters.stretch',
#]

{% if FILTERS is defined %}
FILTERS = {{ FILTERS }}
{% endif %}

################################################################################


################################ Result Storage ################################

## Expiration in seconds of generated images in the result storage
## Defaults to: 0
{% if RESULT_STORAGE_EXPIRATION_SECONDS is defined %}
RESULT_STORAGE_EXPIRATION_SECONDS = {{ RESULT_STORAGE_EXPIRATION_SECONDS }}
{% endif %}

## Path where the Result storage will store generated images
## Defaults to: '/tmp/thumbor/result_storage'
RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = '{{ RESULT_STORAGE_FILE_STORAGE_ROOT_PATH | default('/data/result_storage') }}'

## Indicates whether unsafe requests should also be stored in the Result Storage
## Defaults to: False
{% if RESULT_STORAGE_STORES_UNSAFE is defined %}
RESULT_STORAGE_STORES_UNSAFE = {{ RESULT_STORAGE_STORES_UNSAFE }}
{% endif %}

################################################################################


############################# Queued Redis Detector #############################

## Server host for the queued redis detector
## Defaults to: 'localhost'
REDIS_QUEUE_SERVER_HOST = '{{ REDIS_QUEUE_SERVER_HOST | default('redis') }}'

## Server port for the queued redis detector
## Defaults to: 6379
{% if REDIS_QUEUE_SERVER_PORT is defined %}
REDIS_QUEUE_SERVER_PORT = {{ REDIS_QUEUE_SERVER_PORT }}
{% endif %}

## Server database index for the queued redis detector
## Defaults to: 0
{% if REDIS_QUEUE_SERVER_DB is defined %}
REDIS_QUEUE_SERVER_DB = {{ REDIS_QUEUE_SERVER_DB }}
{% endif %}

## Server password for the queued redis detector
## Defaults to: None
{% if REDIS_QUEUE_SERVER_PASSWORD is defined %}
REDIS_QUEUE_SERVER_PASSWORD = '{{ REDIS_QUEUE_SERVER_PASSWORD }}'
{% endif %}

################################################################################


############################# Queued SQS Detector ##############################

## AWS key id
## Defaults to: None
{% if SQS_QUEUE_KEY_ID is defined %}
SQS_QUEUE_KEY_ID = '{{ SQS_QUEUE_KEY_ID }}'
{% endif %}

## AWS key secret
## Defaults to: None
{% if SQS_QUEUE_KEY_SECRET is defined %}
SQS_QUEUE_KEY_SECRET = '{{ SQS_QUEUE_KEY_SECRET }}'
{% endif %}

## AWS SQS region
## Defaults to: 'us-east-1'
{% if SQS_QUEUE_REGION is defined %}
SQS_QUEUE_REGION = '{{ SQS_QUEUE_REGION }}'
{% endif %}

################################################################################


#################################### Errors ####################################

## This configuration indicates whether thumbor should use a custom error
## handler.
## Defaults to: False
{% if USE_CUSTOM_ERROR_HANDLING is defined %}
USE_CUSTOM_ERROR_HANDLING = {{ USE_CUSTOM_ERROR_HANDLING }}
{% endif %}

## Error reporting module. Needs to contain a class called ErrorHandler with a
## handle_error(context, handler, exception) method.
## Defaults to: 'thumbor.error_handlers.sentry'
{% if ERROR_HANDLER_MODULE is defined %}
ERROR_HANDLER_MODULE = '{{ ERROR_HANDLER_MODULE }}'
{% endif %}

## File of error log as json
## Defaults to: None
{% if ERROR_FILE_LOGGER is defined %}
ERROR_FILE_LOGGER = '{{ ERROR_FILE_LOGGER }}'
{% endif %}

## File of error log name is parametrized with context attribute
## Defaults to: False
{% if ERROR_FILE_NAME_USE_CONTEXT is defined %}
ERROR_FILE_NAME_USE_CONTEXT = {{ ERROR_FILE_NAME_USE_CONTEXT }}
{% endif %}

################################################################################


############################### Errors - Sentry ################################

## Sentry thumbor project dsn. i.e.: http://5a63d58ae7b94f1dab3dee740b301d6a:73ee
## a45d3e8649239a973087e8f21f98@localhost:9000/2
## Defaults to: ''
{% if SENTRY_DSN_URL is defined %}
SENTRY_DSN_URL = '{{ SENTRY_DSN_URL }}'
{% endif %}

## Sentry environment i.e.: staging
## Defaults to: None
{% if SENTRY_ENVIRONMENT is defined %}
SENTRY_ENVIRONMENT = '{{ SENTRY_ENVIRONMENT }}'
{% endif %}

################################################################################


#################################### Server ####################################

## The amount of time to wait before shutting down the server, i.e. stop
## accepting requests.
## Defaults to: 0
{% if MAX_WAIT_SECONDS_BEFORE_SERVER_SHUTDOWN is defined %}
MAX_WAIT_SECONDS_BEFORE_SERVER_SHUTDOWN = {{ MAX_WAIT_SECONDS_BEFORE_SERVER_SHUTDOWN }}
{% endif %}

## The amount of time to waut before shutting down all io, after the server has
## been stopped
## Defaults to: 0
{% if MAX_WAIT_SECONDS_BEFORE_IO_SHUTDOWN is defined %}
MAX_WAIT_SECONDS_BEFORE_IO_SHUTDOWN = {{ MAX_WAIT_SECONDS_BEFORE_IO_SHUTDOWN }}
{% endif %}

################################################################################


################################# HandlerLists #################################

## Handler Lists are responsible for adding new handlers to thumbor app.
## Defaults to: [
#    'thumbor.handler_lists.healthcheck',
#    'thumbor.handler_lists.upload',
#    'thumbor.handler_lists.blacklist',
#]

{% if HANDLER_LISTS is defined %}
HANDLER_LISTS = {{ HANDLER_LISTS }}
{% endif %}


################################### AWS ########################################
# More information https://github.com/thumbor/thumbor-aws
################################## AWS Loader ##################################

## Region where thumbor's objects are going to be loaded from.
## Defaults to: 'us-east-1'
{% if AWS_LOADER_REGION_NAME is defined %}
AWS_LOADER_REGION_NAME = '{{ AWS_LOADER_REGION_NAME }}'
{% endif %}

## S3 Bucket where thumbor's objects are loaded from.
## Defaults to: 'thumbor'
{% if AWS_LOADER_BUCKET_NAME is defined %}
AWS_LOADER_BUCKET_NAME = '{{ AWS_LOADER_BUCKET_NAME }}'
{% endif %}

## Secret access key for S3 Loader.
## Defaults to: None
{% if AWS_LOADER_S3_SECRET_ACCESS_KEY is defined %}
AWS_LOADER_S3_SECRET_ACCESS_KEY = '{{ AWS_LOADER_S3_SECRET_ACCESS_KEY }}'
{% endif %}

## Access key ID for S3 Loader.
## Defaults to: None
{% if AWS_LOADER_S3_ACCESS_KEY_ID is defined %}
AWS_LOADER_S3_ACCESS_KEY_ID = '{{ AWS_LOADER_S3_ACCESS_KEY_ID }}'
{% endif %}

## Endpoint URL for S3 API. Very useful for testing.
## Defaults to: None
{% if AWS_LOADER_S3_ENDPOINT_URL is defined %}
AWS_LOADER_S3_ENDPOINT_URL = '{{ AWS_LOADER_S3_ENDPOINT_URL }}'
{% endif %}

## Loader prefix path.
## Defaults to: '/st'
{% if AWS_LOADER_ROOT_PATH is defined %}
AWS_LOADER_ROOT_PATH = '{{ AWS_LOADER_ROOT_PATH }}'
{% endif %}

################################################################################


################################# AWS Storage ##################################
# Documentation: https://github.com/thumbor/thumbor-aws#storage

## Region where thumbor's objects are going to be stored.
## Defaults to: 'us-east-1'
{% if AWS_STORAGE_REGION_NAME is defined %}
AWS_STORAGE_REGION_NAME = '{{ AWS_STORAGE_REGION_NAME }}'
{% endif %}

## S3 Bucket where thumbor's objects are going to be stored.
## Defaults to: 'thumbor'
{% if AWS_STORAGE_BUCKET_NAME is defined %}
AWS_STORAGE_BUCKET_NAME = '{{ AWS_STORAGE_BUCKET_NAME }}'
{% endif %}

## Secret access key for S3 to allow thumbor to store objects there.
## Defaults to: None
{% if AWS_STORAGE_S3_SECRET_ACCESS_KEY is defined %}
AWS_STORAGE_S3_SECRET_ACCESS_KEY = '{{ AWS_STORAGE_S3_SECRET_ACCESS_KEY }}'
{% endif %}

## Access key ID for S3 to allow thumbor to store objects there.
## Defaults to: None
{% if AWS_STORAGE_S3_ACCESS_KEY_ID is defined %}
AWS_STORAGE_S3_ACCESS_KEY_ID = '{{ AWS_STORAGE_S3_ACCESS_KEY_ID }}'
{% endif %}

## Endpoint URL for S3 API. Very useful for testing.
## Defaults to: None
{% if AWS_STORAGE_S3_ENDPOINT_URL is defined %}
AWS_STORAGE_S3_ENDPOINT_URL = '{{ AWS_STORAGE_S3_ENDPOINT_URL }}'
{% endif %}

## Storage prefix path.
## Defaults to: ''
{% if AWS_STORAGE_ROOT_PATH is defined %}
AWS_STORAGE_ROOT_PATH = '{{ AWS_STORAGE_ROOT_PATH }}'
{% endif %}

## Storage ACL for files written in bucket
## Defaults to: 'public-read'
{% if AWS_STORAGE_S3_ACL is defined %}
AWS_STORAGE_S3_ACL = '{{ AWS_STORAGE_S3_ACL }}'
{% endif %}

## Default location to use if S3 does not return location header. Can use
## {bucket_name} var.
## Defaults to: 'https://{bucket_name}.s3.amazonaws.com'
{% if AWS_DEFAULT_LOCATION is defined %}
AWS_DEFAULT_LOCATION = '{{ AWS_DEFAULT_LOCATION }}'
{% endif %}

################################################################################


############################## AWS Result Storage ##############################
# Documentation: https://github.com/thumbor/thumbor-aws#result-storage

## Region where thumbor's objects are going to be stored.
## Defaults to: 'us-east-1'
AWS_RESULT_STORAGE_REGION_NAME = '{{ AWS_RESULT_STORAGE_REGION_NAME | default('us-east-1') }}'

## S3 Bucket where thumbor's objects are going to be stored.
## Defaults to: 'thumbor'
AWS_RESULT_STORAGE_BUCKET_NAME = '{{ AWS_RESULT_STORAGE_BUCKET_NAME | default('thumbor') }}'

## Secret access key for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_RESULT_STORAGE_S3_SECRET_ACCESS_KEY = '{{ AWS_RESULT_STORAGE_S3_SECRET_ACCESS_KEY | default(None) }}'

## Access key ID for S3 to allow thumbor to store objects there.
## Defaults to: None
AWS_RESULT_STORAGE_S3_ACCESS_KEY_ID = '{{ AWS_RESULT_STORAGE_S3_ACCESS_KEY_ID | default(None) }}'

## Endpoint URL for S3 API. Very useful for testing.
## Defaults to: None
AWS_RESULT_STORAGE_S3_ENDPOINT_URL = '{{ AWS_RESULT_STORAGE_S3_ENDPOINT_URL | default(None) }}'

## Result Storage prefix path.
## Defaults to: '/rs'
AWS_RESULT_STORAGE_ROOT_PATH = '{{ AWS_RESULT_STORAGE_ROOT_PATH | default('/rs') }}'

## ACL to use for storing items in S3.
## Defaults to: None
AWS_RESULT_STORAGE_S3_ACL = '{{ AWS_RESULT_STORAGE_S3_ACL | default(None) }}'

################################################################################

######################### tc_prometheus ########################################
PROMETHEUS_SCRAPE_PORT = {{ PROMETHEUS_SCRAPE_PORT | default(8000) }} # Port the prometheus client should listen on

##################### Thumbor Community Extensions #############################
COMMUNITY_EXTENSIONS = {{ COMMUNITY_EXTENSIONS | default([]) }}
