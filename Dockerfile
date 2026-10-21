# Build image for RunCloud git/atomic deployments: RunCloud's PHP image
# (PHP, Composer and git included) plus Node.js for front-end builds.
#
# Match PHP_VERSION to the web app's PHP version in RunCloud, e.g. 83, 84, 85.
ARG PHP_VERSION=85
FROM runcloud/php${PHP_VERSION}rc:latest

# Node.js major version from NodeSource. 24 is the current LTS.
ARG NODE_VERSION=24

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Fail the build if anything is missing.
RUN php --version && composer --version && git --version && node --version && npm --version
