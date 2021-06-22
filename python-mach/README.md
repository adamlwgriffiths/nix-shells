# Python-Mach

This is currently my preferred method.

Uses [https://github.com/DavHau/mach-nix](`mach-nix`) to install and manage Python dependencies.

This tool does not need to be installed into the system (can be in shell.nix only) and makes
installing Python packages almost trivial.

It supports standard python `requirements.txt` files which makes sharing code with
other projects and developers (non-Nix) far easier.

One great feature is the ability to over-ride the requirements file and specify
specific projects that should be installed from Nix instead.
This helps with some packages that don't work straight out of PyPi (Eg. PyOpenGL).
