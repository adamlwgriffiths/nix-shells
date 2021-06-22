# Python-Venv

Setups up a minimal Python with a virtual environment into which you can
then `pip install` other dependencies.

This _only_ works if you intend to install packages using `pip`.

Some packages (PyOpenGL, PyIMGUI) don't work on Nix directly from PyPi and you must use another
method.

See `python-nix` and `python-mach` for alternatives.
