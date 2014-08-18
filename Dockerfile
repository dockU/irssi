FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed irssi figlet screen

RUN mkdir -p /home/irssi
RUN /usr/bin/useradd -m -d /home/irssi irssi

VOLUME ["/srv/irssi/.irssi", "/srv/irssi/irclogs"]

USER irssi

CMD ["/usr/bin/screen", "-S irssi", "/usr/bin/irssi"]
