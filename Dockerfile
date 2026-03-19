# syntax=docker/dockerfile:1-labs
FROM --platform=$BUILDPLATFORM fr3akyphantom/arch-pkgbuild-builder:latest

ARG TARGETPLATFORM
ARG BUILDPLATFOR

RUN <<-'EOL'
	set -x
	# Update System pacman db
	( pacman -Syu --noconfirm 2>/dev/null ) || ( pacman -Syu --noconfirm 2>/dev/null || true )
	# Cleanup pacman cache
	( sudo rm -rvf /tmp/* /var/cache/pacman/pkg/* /home/app/.cache/yay/* /home/app/.cache/paru/* 2>/dev/null || true )
EOL

COPY entrypoint.sh /entrypoint.sh

RUN sudo chmod 0755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
