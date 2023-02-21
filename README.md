# Python Template

This is my template for new Python projects. The template is can be installed with [cookiecutter](https://github.com/cookiecutter/cookiecutter) and it's meant for developing inside a container using VS Code [Dev Containers](https://code.visualstudio.com/docs/remote/containers) extension.

## Quick start

If you're familiar with both cookiecutter and Dev Containers, this may be all you need:

```bash
cookiecutter https://github.com/tjkemp/python-template.git
```

Otherwise, check instructions further down the document.

## Features

 - VS Code devcontainer configured with Python 3.11 and nice settings,
 - *ruff* and *black* for linting and formatting,
 - *pytest* for testing,
 - *pipx*, *pip-tools*,
 - *pre-commit*,
 - *just* to run all sorts of maintenance tasks.

## Background

The repository started as a compilation of Python coding style recommendations. Since then Python tooling has improved and I realized most of the style considerations can (and should) be automated away. With a nice formatter and linter there's almost no need to worry about style anymore.

Installing all this new tooling can be quite a bit of work though, so this repository is turning into a template for new Python projects with everything set up the way I like it. I hope you find it useful as well. Let me know if it works or not. Otherwise I will probably be updating it about twice a year.

## How to Use the Template

Requirements:
 - [cookiecutter](https://github.com/cookiecutter/cookiecutter) (install with `pip install --user cookiecutter`)
 - [Visual Studio Code](https://code.visualstudio.com) (not strictly required, but without it you need set up a Python environment and install all the tooling manually)
 - Tested on Linux (Ubuntu), should work on Windows 10 and Mac as well


### Step 1. Run cookiecutter

Run cookiecutter with the url of this repository as an argument in the directory where you want to create the project directory.

```bash
cookiecutter https://github.com/tjkemp/python-template.git
```

Cookiecutter will ask you a few questions. The default values are shown in brackets.

```bash
username [username]: username
project_name [My Python Project]: My Python Project
project_slug [my-python-project]: my-python-project
python_version [3.11]: 3.11
```

This would create directory named whatever you input as "project_slug". In this case it would be "my-python-project".

### Step 2. Start VS Code

Next enter the project directory and run `code .` to start VS Code. When VS Code starts, it will ask you if you want to open the project in a devcontainer. Select *Reopen in Container*.

```bash
$ cd my-python-project
$ code .
```

All the dependencies should be installed automatically. If you get an error message, try running `just install` in the terminal inside the container.

### Step 3. Initialize git repository

This step is optional. If you want to use git, run the following commands in the terminal inside the container.

```bash
$ git init
$ git add .
$ git commit -m "Initial commit"
```

Everything should be set up. Start coding!
