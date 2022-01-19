# pihole

DNS-based ad-blocker and custom DNS provider.

## Configuration

Touch `etc-dnsmasq.d` and `etc-pihole` folders.

Modify environment variables in `docker-compose.yml`

- `TZ` - "TZ Database Name" of your time zone.
- `WEBPASSWORD` - Password to log into the web interface.
- `FTLCONF_REPLY_ADDR4` - IP Address of the host running pihole.

If running on a Raspberry Pi that's using cpuminer, you're going to get a
constant warning about the CPU load. You can disable this by adding the
following line to `etc-pihole/pihole-FTL.conf`

```text
CHECK_LOAD=false
```

Configure other settings however you'd like. Add new block lists, configure DNS
entries, etc.
