# Yet Another Python Style Guide

This guide is a somewhat opinionated compilation of Python coding style suggestions.

The main suggestion is to use opinionated automation (a linter and a formatter) to take care of the details as much as possible. This style guide is for the rest.

The point of having style guidelines is to have a common vocabulary of coding so people can concentrate on what you're saying rather than on how you're saying it.


### Tooling

For formatting and linting, use

- [*black*](https://black.readthedocs.io/en/stable/index.html) for formatting (enable Format Code on Save on your IDE), and

- [*flake8*](https://flake8.pycqa.org/en/latest/) for linting.

For testing, use

- [*pytest*](https://docs.pytest.org/en/stable/), and

- [*coverage*](https://coverage.readthedocs.io/) for measuring test coverage.

For Python installation and managing virtual environments, use

- [*pyenv*](https://github.com/pyenv/pyenv) for managing installations of Python versions,

- [*venv*](https://docs.python.org/3.8/tutorial/venv.html#creating-virtual-environments) for creating environments (because it’s simple, universal, and Pipenv hangs, or at least used to, with large data science packages).


## Style recommendations

### Code lay-out

- Use *black*'s default maximum line length of 88 characters. Docstrings and comments should still be wrapped at 72 chars as recommended by PEP8. (According to PEP8, maximum line length can be configured to be between 79 and 99 chars.)

- If an expression does not fit on one line, surround it with parentheses and add line breaks and indentation to make it easier to read. Do this rather than using the \ line continuation char.

- Line breaks should be before a binary operator:

:white_check_mark:
```python
income = (
  gross_wages
  + taxable_interest
  + (dividends - qualified_dividends)
  - ira_deduction
  - student_loan_interest
)
```

- Prefer hanging indent over aligning with opening parenthesis for better readability.

:x:
```python
def my_function(var_one,
                var_two,
                var_three):
```

:white_check_mark:
```python
def my_function(
        var_one,
        var_two,
        var_three,
    ):
```

- Use blank lines in functions, but sparingly, to indicate logical sections.


### Imports

- Imports should be grouped in the following order:
  1. standard library imports
  2. related third party imports
  3. local application/library specific imports

There should be a blank line between each group of imports. Each group should be sorted in alphabetical order, ignoring case, according to full package path.

- Prefer absolute imports over relative imports.


### Strings

- Prefer double-quoted strings. (In Python, single-quoted strings and double-quoted strings are the same. PEP8 does not make a recommendation for this.)

- For triple-quoted strings, always use double quote characters instead of single quote characters to be consistent with the docstring convention in PEP 257.

- Prefer interpolated f-Strings over C-style and `str.format()`.


### Comments

- Never state the obvious with comments, e.g. `x = x + 1  # Increment x`. Add a comment if you would have to explain it in a code review or if it's hard to deduce why a certain thing is done.

- Comments should be complete sentences with the first word capitalized and a period at the end.


### Docstrings

- PEP 257 says
  - public modules, functions, classes, and methods should have a docstring,
  - non-public methods should have a comment that describes what it does, and
  - docstrings must use triple double quotes (`"""`) instead of triple single quotes (`'''`).
- If the codebase is a library, the docstring of module or a package should list the classes, exceptions and functions (and any other objects) that are exported, with a one-line summary of each.
- Use Google style docstring notation ([see examples](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html)).

Example docstring for a function:

```python
def fetch_rows(
    table: Table,
    keys: List[str],
    require_all_keys: bool = False,
) -> Mapping[str, Tuple[str]]:
    """Fetches rows from a Table.

    Retrieves rows with given keys from the Table instance.

    Args:
        table: An instance of Table.
        keys: A sequence of strings representing the key of each table
            row to fetch.
        require_all_keys: Optional; If require_all_keys is True only
            rows with values set for all keys will be returned.

    Returns:
        A dict mapping keys to the corresponding table row data.

    Raises:
        IOError: An error occurred accessing the table.

    """
    pass
```

Example docstring for a module:

```python
"""A one line summary of the module, terminated by a period.

Leave one blank line. The rest of this docstring should contain an
overall description of the module. Optionally, it may also contain a
brief description of exported classes and functions and/or usage
examples.

  Typical usage example:

  foo = ClassFoo()
  bar = foo.FunctionBar()

"""
```


### Naming conventions

- Use longer than one char variable names, because it improves readability, and discourages complex expressions.

- Modules and packages should have short, all-lowercase names, no dashes.

  - Underscores can be used in the module name if it improves readability, but the use of underscore in package name should be avoided.

- Use of underscores:

  - `_single_leading_underscore`: An indicator of an internal method/function or a "protected" variable. Use this if the method/function is not meant to be accessed outside the class/module

  - `single_trailing_underscore_`: Use trailing underscore to avoid conflicts with a Python keyword.

  - `__double_leading_underscore`: Indicates a private class variable and invokes name mangling. Only consider using this to avoid naming conflicts with subclasses that are out of your control.

  - `__double_leading_and_trailing_underscore__`: A “magic” objects or attributes. Never invent these.


### Exceptions

- In Python, it's normal practice to use exceptions for non-error situations to control execution flow. For example, prefer raising an exception instead of returning `None`.

- Use the suffix "Error" instead of "Exception" on your exception names if the exception actually is an error.


### Functions

- Prefer to write functions that do not mutate the arguments or produce other side effects. If the function has side effects, make a note of it in the docstring.

- Enforce clarity with keyword-only and positional-only arguments.

- Prefer comprehensions instead of `map` and `filter`.


### Classes

- Prefer plain attributes instead of setter and getter methods.


### Typing

- Use type hints according to PEP-484, and type check the code with a type checking tool.


## Sources

The guide does it's best to honor recommendations of PEPs, Zen of Python (especially "explicit is better than implicit", "readability counts", and "there should be one obvious way to do it"), and other sources listed below.

- [PEP8](https://pep8.org/) - awesomely formatted and curated PEP8
- [Google style guide](https://google.github.io/styleguide/pyguide.html)
- [Effective Python](https://effectivepython.com/) by Brett Slatkin
- [wemake-python-styleguide](https://wemake-python-stylegui.de/en/latest/) - "the strictest and most opinionated python linter ever"
