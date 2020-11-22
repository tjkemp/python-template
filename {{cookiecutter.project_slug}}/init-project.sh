#!/bin/bash

function process_status () {
  if [ $? -eq 0 ]; then
    echo " OK"
  else
    echo " FAILED"
    exit
  fi
};

echo Creating a virtual environment...
python -m venv venv || { process_status; }

echo Updating pip...
venv/bin/pip install --upgrade pip setuptools wheel || { process_status; }

echo Creating requirements.txt...
pip-compile requirements/requirements.in || { process_status; }

echo Installing dependencies...
echo pip install -r requirements/requirements.txt || { process_status; }

echo Virtual environment created. Type \"source venv/bin/activate\" to activate it.
