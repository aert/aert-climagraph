
PROJECT_NAME=climagraph
PROJECT_VERSION:=$(shell python version.py)
PROJECT_FILENAME=$(PROJECT_NAME)_$(PROJECT_VERSION)
VAGRANT_PATH=deploy

CONF=`pwd`/climagraph/etc/config_develop.ini
FIXTURES=deploy/ansible/roles/app_climagraph/files

PIP_CACHE=./build/pip_cache

##  Installation Paths:
#PREFIX?=/usr


## default target, it's what to do if you typed "make" without target
default: 
	@echo "-- default target: empty"
	
	
## This target englob all the targets on this makefile
all:  clean develop vagrant_setup


## clean temporary files after a building operation
clean:
	@echo "Cleaning..." 
	@rm -rf public/climagraph/
	@rm -rf `find . -name *.pyc`
	@rm -rf `find . -name *.pyo`
	@rm -rf docs/build

clean_all:
	@$(MAKE) clean
	@rm -rf build


# DEVELOP
# #######

develop:
	@pip install -e .[testing] --download-cache $(PIP_CACHE)
	@pip install -e .[docs] --download-cache $(PIP_CACHE)

develop_init: develop_deps develop

develop_deps:
	@sudo apt-get install python-dev
	# For wheel
	@pip install --upgrade pip setuptools
	@mkdir -p logs

semantic_latest:
	@mkdir -p build/
	@rm -rf build/semantic*
	cd build; wget http://semantic-ui.com/build/semantic.zip; unzip semantic.zip -d semantic
	@rm -rf climagraph/common/static/vendor/semantic/
	mv build/semantic/packaged climagraph/common/static/vendor/semantic/
	@rm -rf build/semantic*

# DEPLOYMENT
# ##########

tag:
	@while [ -z "$$NEW_TAG" ]; do \
			read -r -p "New tag: " NEW_TAG; \
	done; \
	git tag -a $$NEW_TAG -m "Created tag: $$NEW_TAG"; \
	git push --tags;

installer: develop installer_clean wheel installer_archive

installer_clean:
	@rm -rf dist
	@mkdir -p build/installer
	@rm -rf build/*_setup
	@rm -rf build/*_setup.tgz

wheel:
	@pip wheel --wheel-dir=build/wheel/wheel-dir . --download-cache $(PIP_CACHE)
	@mv build/wheel/wheel-dir build/installer/wheel-dir
	@rm -rf build/wheel/

installer_archive:
	@cp deploy/installer/Makefile build/installer/
	@sed -i 's/__VERSION__/$(PROJECT_VERSION)/g' build/installer/Makefile
	@cp deploy/installer/requirements.txt build/installer/
	@mv build/installer/ build/$(PROJECT_FILENAME)_setup
	@cd build; tar -czf $(PROJECT_FILENAME)_setup.tgz $(PROJECT_FILENAME)_setup/

