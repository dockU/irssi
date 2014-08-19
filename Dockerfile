FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed irssi figlet screen oidentd cpanminus wget

RUN /usr/bin/vendor_perl/cpanm LWP::UserAgent

RUN /usr/bin/useradd -m -d /home/jchen jchen
ADD https://github.com/fly.keys /home/jchen/.ssh/authorized_keys
RUN passwd -d jchen
RUN chown -R jchen:jchen /home/jchen

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

ADD oidentd_run /service/oidentd/run

ENV HOME /home/jchen

EXPOSE 113
