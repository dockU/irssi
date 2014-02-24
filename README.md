# irssi

Irssi Docker image, based on [docku/sshd](https://github.com/dockU/sshd).

### Volumes:

```
VOLUME ["/srv/irssi/.irssi", "/srv/irssi/logs"]
```

* `/srv/irssi/.irssi` should be where your config, themes and scripts go.
* `/srv/irssi/logs` is for your logs.

