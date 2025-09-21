# syntax=docker/dockerfile:1-labs
FROM --platform=$BUILDPLATFORM fr3akyphantom/vapoursynth-av1an-base:latest

ARG TARGETPLATFORM
ARG BUILDPLATFORM

# USER app
# WORKDIR /tmp
# SHELL ["/bin/bash", "-c"]

RUN <<-'EOL'
	# Update System Immediately
	( sudo pacman -Syu --noconfirm 2>/dev/null ) || ( sudo pacman -Syu --noconfirm 2>/dev/null || true )
	( sudo rm -rvf /var/cache/pacman/pkg/*.pkg.tar.zst* 2>/dev/null || true )
	set -ex
	export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/bin"
	sudo pacman -S --noconfirm --needed git unzip namcap fakeroot audit grep diffutils
	mkdir -p /home/app/.gnupg
	sudo echo "keyserver hkp://keyserver.ubuntu.com" >/home/app/.gnupg/gpg.conf
	chmod 700 /home/app/.gnupg
	chmod 600 /home/app/.gnupg/gpg.conf
	( sudo rm -rvf /tmp/* /var/cache/pacman/pkg/* /home/app/.cache/yay/* /home/app/.cache/paru/* 2>/dev/null || true )
EOL

WORKDIR /home/app
