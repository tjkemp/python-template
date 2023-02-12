# Python Project Template

This is my personal template for new Python projects. The template is installable with [cookiecutter](https://github.com/cookiecutter/cookiecutter) and it uses Visual Studio [devcontainer](https://code.visualstudio.com/docs/remote/containers) as a way to manage the environment.

A little bit of background. The repository started as a compilation of Python coding style recommendations. With time Python tooling has been improving and I realized most of the style considerations can (and should) be automated away. But now, installing all this new tooling can be quite a bit of work, so this repository is turning into a template for new Python projects with everything set up the way I like it. I hope you find it useful as well. Note that I'll be updating it probably only every half a year or so.

## Features
 - **VS Code devcontainer** with Python 3.11, *black*, *ruff*, *pytest*, *pipx*, *pip-tools*, *pre-commit*, *just*, and *Pylance*.

## How to Use the Template

Requirements:
 - cookiecutter
 - VS Code editor (not strictly required, but then you need to set up a Python environment and install all the tooling manually)

To start a new Python project

1) **Run cookiecutter** with the url of this repository as an argument in the directory where you want to create the project directory, and
2) **Start VS Code** in the project directory and open the project in the devcontainer.

So for example, to create a new project called *My Python Project* with MIT license, run the following commands:

## An example

```bash
$ cookiecutter https://github.com/tjkemp/python-project-template

username [username]: tjkemp
project_name [My Python Project]: My Python Project
project_slug [my-python-project]: my-python-project
python_version [3.11]: 3.11
Select open_source_license:
1 - MIT license
2 - BSD license
3 - GNU General Public License v3
4 - Not open source
Choose from 1, 2, 3, 4 [1]: 1
```

This would create directory *my-python-project* into the current directory with nice default configurations.

Next enter the project directory and run `code .` to start VS Code. When VS Code starts, it will ask you if you want to open the project in a devcontainer. Select *Reopen in Container*.

```bash
$ cd my-python-project
$ code .
```

Everything should be set up. Start coding!
