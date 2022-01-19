# nginx

Used as a reverse proxy listening on port 80 to forward incoming requests to
other services running on other ports.

## Configuration

- Touch the `certs` and `config` folders.
- Populate the `config` directory with desired config files.

Create config files for each service. File name `service_name.conf`. Example
below to reverse proxy a service running on port 9000 where the incoming DNS
name is `service_name`

```text
server {
    listen 80;
    server_name service_name;

    location / {
        proxy_pass http://host.docker.internal:9000;
        proxy_set_header Host host.docker.internal;
        proxy_set_header X-Real-IP $remote_addr;
        proy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
