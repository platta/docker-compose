# docker-compose

Docker compose configurations for various home services.

## General concepts

### Networks

Create an overlay network called `shared_net` before deploying anything.

Each stack should live on its own isolated network, and only containers that
need to be exposed via nginx should be added to the shared network.

The nginx stack has services that live on the shared network and it will deal
with reverse proxy operations.

### Monitoring

The monitoring stack collects a lot of info.
