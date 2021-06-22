# Python-Nix

Python the Nix way.

Demonstrates how to install Python packages from Nix and get them running.

If you simply install Python and the relevant packages, Python won't be able to see them as they are
not on PYTHONPATH.

The easiest way to fix this is to create a custom Python derivative, which is demonstrated here.
