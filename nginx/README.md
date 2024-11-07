# nginx

Used as a reverse proxy listening on port 80 to forward incoming requests to
other services running on other ports.

## Adding a new service to nginx

Create whatever DNS entries you may need for your new subdomain.

Stand up your service. Make sure anything that you're going to reverse proxy to
is attached to `shared_net`.

Create a new version of `nginx_authelia_configuration.yml` that adds whatever
you need for the new subdomain, and a new version of `nginx_nginx.conf` that
declares **ONLY THE HTTP** server block.

Update the nginx stack to use the new configs.

Shell into the certbot container to generate the SSL certificate for the new
subdomain (see details in another section below).

Create a new version of `nginx_nginx.conf` to add the SSL server block.

Update the nginx stack to use the new config.

Done!

## Configuration

! This piece is outdated. Everything goes in one config file now because it's
deployed using Swarm configs.

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

```console
$ certbot certonly --webroot -w /var/www/certbot \
    --email user@yoursite.com -d service.yoursite.com \
    --rsa-key-size 4096 --agree-tos --force-renewal

...
```

## Authelia

Maintain the user database in the `nginx_authelia_users_database.yml` secret.

Encode passwords by entering the Authelia container and using the `authelia`
command.

```console
$ authelia hash-password --sha512 -- 'Password123!'
Digest: $6$rounds=...etc...
```

The hashed password is the string that comes after "Digest: ".

```yml
users:
  address@domain.com:
    displayname: "User Name"
    password: "hashed password"
    email: "address@domain.com"
    groups:
      - group1
      - group2
```
