# nix-shell examples

Examples of various shell.nix files that I've found work in different situations.

My knowledge of Nix is slowly expanding and so these may not all be examples
of best practice. Many can be improved or even merged together to be better.

They did solve problems I had and I felt that sharing them is still worthwhile.

So please do not treat these as the "Gold Standard".

Take what you need to solve your problems.

## Caveat

I am not a Nix expert. There are most likely better ways to do this, and better tools to use.

I am documenting what I have found to work for myself, and for others who are also struggling with Nix.

## direnv

Put the following in your `project-dir/.envrc` to automatically activate the nix-shell

```
use_nix

```
## Databases / services

I highly recommend using Docker / Docker-Compose for this which lets you mount local directories into docker images.


## Docker

* `docker-compose` - Starts Postgres and Redis databases with local database files

## Nim

* `nim-minimal` - Barebones Nim + Nimble.
* `nim-nimble` - Bootstraps Nim with Nimble which is then used to install dependencies.

## Python

* `python-mach` - Preferred method of installing Python packages from Nix and PyPi
* `python-nix` - Correctly install packages from Nix
* `python-venv` - Basic venv bootstrap which then uses `pip` to install dependencies.
