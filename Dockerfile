FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed irssi figlet screen oidentd

RUN mkdir -p /srv/$LUSER
RUN /usr/bin/useradd -m -d /home/$LUSER $LUSER
ADD https://github.com/fly.keys /home/$LUSER/.ssh/authorized_keys
RUN passwd -d $LUSER
RUN chown -R $LUSER:$LUSER /home/$LUSER

VOLUME ["/home/$LUSER/.irssi", "/home/$LUSER/irclogs"]

ADD oidentd_run /service/oidentd/run

USER $LUSER

CMD ["/usr/bin/screen", "-S irssi", "/usr/bin/irssi"]
