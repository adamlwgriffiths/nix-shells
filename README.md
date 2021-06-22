# Shell Templates

Examples of various shell.nix files that I've found work in different situations.

My knowledge of Nix is slowly expanding and so these may not all be examples
of best practice. Many can be improved or even merged together to be better.

They did solve problems I had and I felt that sharing them is still worthwhile.

So please do not treat these as the "Gold Standard".

Take what you need to solve your problems.

## Python

* `python-mach` - Preferred method of installing Python packages from Nix and PyPi
* `python-nix` - Correctly install packages from Nix
* `python-venv` - Basic venv bootstrap which then uses `pip` to install dependencies.

## Nim

* `nim-nimble` - Bootstraps Nim with Nimble which is then used to install dependencies.
