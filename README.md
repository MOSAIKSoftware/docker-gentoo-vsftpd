# vsftpd via Docker

## Building

Clone this repository and issue the following command inside the top directory:
```sh
docker build -t mosaiksoftware/gentoo-vsftpd .
```

## Starting

Start the container:
```sh
docker run \
	-ti \
	-v /srv/vsftpd/vsftpd.conf:/etc/vsftpd/vsftpd.conf \
	mosaiksoftware/gentoo-vsftpd
```

## Configuration

All configuration variables from ` man 5 vsftpd.conf`
can simply be set when starting the container via the `-e` switches. E.g.
if you want to set `allow_anon_ssl=YES` you just pass
`-e allow_anon_ssl=YES` to the `docker run` command. This will overwrite
the value from the configuration file. A default configuration file is at
`/etc/vsftpd/vsftpd.conf`. It can be mounted into the container. It's also
possible to specify a different config file location via
`-e VSFTPD_CONF=/some/path`.
