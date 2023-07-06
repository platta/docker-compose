# portainer

This stack stands up the Portainer server and the Portainer agent for a swarm
cluster. The server can bounce between hosts in the swarm, but we need one
instance of the agent on each host, so it is declared global.
