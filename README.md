# irssi

Irssi Docker image, based on [docku/sshd](https://github.com/dockU/sshd).

### envvar:

`$LUSER` should be the username you want to use.

### Volumes:

```
VOLUME ["/home/$LUSER/.irssi", "/home/$LUSER/irclogs"]
```

* `/home/$LUSER/.irssi` should be where your config, themes and scripts go.
* `/home/$LUSER/irclogs` is for your logs.

