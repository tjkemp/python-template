#!/usr/bin/env bash

function process_status () {
  if [ $? -ne 0 ]; then
    echo " FAILED"
    exit 1
  else
    echo " OK"
  fi
};

declare -a prerequisites=("python" "git")

for var in "${prerequisites[@]}"
do
  if ! [ -x "$(command -v ${var})" ]; then
    echo "Error: ${var} is not installed." >&2
    exit 1
  fi
done

read -n 1 -p "This will install Python packages into current environment. Press any key to continue or Ctrl-C to cancel."

echo -n Updating pip and its friends...
pip install -q --upgrade pip setuptools wheel ; { process_status; }

if [ -x "$(command -v pip-compile)" ]; then
  echo -n Updating requirements.txt with pip-compile...
  pip-compile -q requirements/requirements.in ; { process_status; }
else
  echo INFO - Install \'pip-tools\' and run \'pip-compile\' to keep your requirements.txt up to date
fi

echo -n Installing dependencies...
venv/bin/pip install -q -r requirements/requirements.txt ; { process_status; }

echo -n Initializing git repository...
git init ; { process_status; }

if [ -x "$(command -v pre-commit)" ]; then
  echo -n Installing pre-commit hooks...
  pre-commit install ; { process_status; }
else
  echo INFO - Install \'pre-commit\' to have tests run automatically on commit
fi

echo Everything is ready! Type \"code .\" to start coding.
