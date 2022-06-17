# Yet Another Python Style Guide

This repository started as a personal and opinionated compilation of Python coding style recommendations. I realized that most of the style considerations can (and should) be automated away. But then, installing all the tooling can be quite a bit of work. And even then, the tooling is advancing fast enough to make a codebase difficult to work with after a break of year or two in development.

So after these revelations the project is (very) slowly turning into development environment for new Python projects.

The repository can already be used as a [cookiecutter](https://github.com/cookiecutter/cookiecutter) template. Next step is to make it a Visual Studio [devcontainer](https://code.visualstudio.com/docs/remote/containers) environment.

The style guide part is still [here](%7B%7Bcookiecutter.project_slug%7D%7D/STYLEGUIDE.md) to be included as a part of a new Python project.

## Using the repository as a cookiecutter template

### Requirements
 - Linux (tested on Ubuntu)

To have everything work smoothly and to be able to use `init-env.sh` to initialize a project, the following prerequisities should be met:
 - pipx (used for installing the dependencies below; recommended)
 - cookiecutter (installed with pipx; required)
 - pyenv (to install Python versions; recommended)
 - pip-tools (installed with pipx; recommended)
 - pre-commit (installed with pipx; recommended)

To create a new project directory, run cookiecutter with the url of the repo as a parameter.

```bash
$ cookiecutter https://github.com/tjkemp/python-style-guide

username [username]: tjkemp
project_name [My Python Project]: My cool project
project_slug [my-python-project]: my-cool-project
Select open_source_license:
1 - MIT license
2 - BSD license
3 - GNU General Public License v3
4 - Not open source
Choose from 1, 2, 3, 4 [1]: 1
```

This would create directory *my-cool-project* into the current directory with nice default configurations.

Next enter the project directory and run `init-env.sh` to initialize new Python environment and package management.

```bash
$ cd my-cool-project
$ ./init-env.sh

Creating a virtual environment "venv"...
Updating pip and friends...
Updating requirements.txt with pip-compile...
Installing dependencies...
Initializing git repository...
Installing pre-commit hooks...

Virtual environment created succesfully.

Type "source venv/bin/activate" to activate the environment.
Type "code ." to start coding.
```

Everything should be set up, now initialize a repo and start coding!
