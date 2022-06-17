#!/usr/bin/env bash

function process_status () {
  if [ $1 -ne 0 ]; then
    echo -e "\n FAILED (error code $1)"; exit 1
  else
    echo " OK"
  fi
};

echo -n "Creating a virtual environment \"venv\"... "
python -m venv venv; process_status $?

echo -n "Updating pip... "
venv/bin/pip install -q --upgrade pip setuptools wheel; process_status $?

if [ -x "$(command -v pip-compile)" ]; then
  echo -n "Updating requirements.txt with pip-compile... "
  pip-compile -q requirements/requirements.in; process_status $?
else
  echo "WARNING - requirements.txt NOT updated - install pip-tools and run pip-compile to keep your requirements.txt up to date"
fi

echo -n "Installing dependencies... "
venv/bin/pip install -q -r requirements/requirements.txt; process_status $?

echo -n "Creating a VS Code default settings file... "
cp .vscode/settings-default.json .vscode/settings.json; process_status $?

echo
echo "Virtual environment created."
echo "Type \"source venv/bin/activate\" to activate it. Type \"code .\" to start coding. "
echo
