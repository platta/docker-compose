# ltc

Headless Litecoin node.

## Configuration

Modify the volume mapping if necessary.

```
$ docker volume create <myVolume>
$ docker volume inspect <myVolume>
[
    {
        "CreatedAt": "0001-01-01T00:00:00Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/<myVolume>/_data",
        "Name": "<myVolume>",
        "Options": {},
        "Scope": "local"
    }
]
$ mkdir /mnt/<myVolume>
# if you already have data in your volume, you should copy it to `/mnt/<myVolume>` now
$ sudo rm -rf /var/lib/docker/volumes/<myVolume>/_data
$ sudo ln -s /mnt/<myVolume> /var/lib/docker/volumes/<myVolume>/_data
```
