FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Sy --noconfirm --needed irssi

RUN /usr/bin/useradd -m -d /srv/irssi -k /etc/skel irssi

VOLUME ["/srv/irssi/.irssi", "/srv/irssi/logs"]

