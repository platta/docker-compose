# thelounge

Persistently connected web-based IRC client.

## Configuration

After launching the container, use the following command to add a user you can
log in as.

```bash
docker exec --user node -it thelounge thelounge add [username]
```

If you need to restore certificates you've previously used, you can inject them
into the volume. Yes, a different docker-compose file could've made this easier,
but I didn't know CertFP was a thing when I built this.

You can either find the volume on your local storage, or open a bash shell into
the container. The certificates are stored in `/certificates` in the volume, or
`var/opt/thelounge/certificates` in the container.

What you'll need to do is set up the network inside The Lounge, and switch the
authentication to Client certificate (SASL EXTERNAL) and save the network. Then,
in the terminal find the `.crt` and `.pem` file in the certificates folder. Both
files will be named using the guid that identifies the network. You can find
this guid in the URL when modifying the network's configurations in The Lounge.
Replace the contents of the `.crt` and `.pem` files with the PEM-formatted
certificate and private key, respectively.

Once you disconnect and reconnect, you should authenticate using the correct
certificate.
