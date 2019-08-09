PYTHON_INTERPRETER=python3
VENV_PATH=.venv
PIP=$(VENV_PATH)/bin/pip
YOUTUBEDL=$(VENV_PATH)/bin/youtube-dl
STORAGE=/media/thenonda/Elements/documentaires/
VERSION=0.1.0

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@echo "  install             -- to install this project with virtualenv and Pip"
	@echo ""
	@echo "  clean               -- to clean EVERYTHING (Warning)"
	@echo "  clean-pycache       -- to remove all __pycache__, this is recursive from current directory"
	@echo "  clean-install       -- to clean Python side installation"
	@echo ""
	@echo "  get                 -- to download video from given url as argument (add 'url=myurl' at the end)"
	@echo "  scan                -- to given url to ensure video can extracted (add 'url=myurl' at the end)"
	@echo ""
	@echo "  update              -- to quickly update youtube-dl package"
	@echo ""
	@echo "  registry            -- to make registry of saved files from storage $(STORAGE)"
	@echo ""
	@echo "  version             -- to printout this project version"
	@echo

clean-pycache:
	find . -type d -name "__pycache__"|xargs rm -Rf
	find . -name "*\.pyc"|xargs rm -f
.PHONY: clean-pycache

clean-install:
	rm -Rf $(VENV_PATH)
.PHONY: clean-install

clean: clean-install clean-pycache
.PHONY: clean

venv:
	virtualenv -p $(PYTHON_INTERPRETER) $(VENV_PATH)
	# This is required for those ones using ubuntu<16.04
	$(PIP) install --upgrade pip
	$(PIP) install --upgrade setuptools
.PHONY: venv

install: venv
	$(PIP) install -r requirements.txt
.PHONY: install

get:
	$(YOUTUBEDL) $(url)
.PHONY: get

scan:
	$(YOUTUBEDL) --verbose --get-url $(url)
.PHONY: scan

update:
	$(PIP) install --upgrade youtube-dl
.PHONY: install

registry:
	@tree -h $(STORAGE) > registry.txt
.PHONY: registry

version:
	@echo "youdl version $(VERSION)"
.PHONY: version
