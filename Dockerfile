FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed irssi figlet screen

RUN /usr/bin/useradd -m -d /srv/irssi -k /etc/skel irssi

VOLUME ["/srv/irssi/.irssi", "/srv/irssi/irclogs"]

ADD start /usr/local/bin/start

USER irssi

ENTRYPOINT /usr/local/bin/start
