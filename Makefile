clean:
	rm -rf venv

setup:
	pip install pip-tools
	pip install virtualenv

venv:
ifeq ("$(wildcard $(venv))","")
	virtualenv venv
endif

	. venv/bin/activate && pip-compile --no-index --output-file requirements.txt setup.py
	pip install -r requirements.txt
	pip install -r test_requirements.txt
