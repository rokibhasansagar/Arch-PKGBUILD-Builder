# syntax=docker/dockerfile:1-labs
FROM --platform=$BUILDPLATFORM fr3akyphantom/arch-pkgbuild-builder:latest

ARG TARGETPLATFORM
ARG BUILDPLATFOR

COPY entrypoint.sh /entrypoint.sh

RUN sudo chmod 0755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
