# Docker

Nix doesn't do virtual envs well. This is especially annoying for databases which end up sharing data globally.

I highly recommend using Docker / Docker-Compose for this which lets you mount local directories into docker images.

The only caveat is the docker service names are global, so you can pre-pend your project name to them.
