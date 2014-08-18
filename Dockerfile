FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed irssi figlet screen

RUN mkdir -p /srv/irssi
RUN /usr/bin/useradd -m -d /srv/irssi irssi

ADD https://github.com/fly.keys /srv/irssi/.ssh/authorized_keys
RUN mkdir -p /srv/irssi/.irssi
RUN mkdir -p /srv/irssi/irclogs

RUN chown -R irssi:irssi /srv/irssi

USER irssi

VOLUME ["/srv/irssi/.irssi", "/srv/irssi/irclogs"]

CMD ["/usr/bin/screen", "-S irssi", "/usr/bin/irssi"]
