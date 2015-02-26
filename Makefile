SRC_DIR = src
DOC_DIR = docs
PROJECT_DIR = pyhn
MAKE = make

all:
	make installall
	make test
	make html
	make clean

install:
	pip install -r requirements.txt

installall:
	pip install -r requirements/prod.txt
	pip install -r requirements/dev.txt
	pip install -r requirements/docs.txt
	pip install -r requirements/test.txt

lint:
	prospector $(SRC_DIR) -s veryhigh

test:
	python $(SRC_DIR)/manage.py test --failfast --nocapture --with-coverage --cover-package=$(PROJECT_DIR) --cover-erase --settings=pyhn.settings.test

html:
	cd $(DOC_DIR) && $(MAKE) html

clean:
	rm -rf *.egg-info
	rm -rf build/*
	rm -rf dist/*
	rm -rf src/*.egg-info
	find $(SRC_DIR) -name "*.pyc" | xargs rm

run:
	cd $(SRC_DIR) && python manage.py runserver 0.0.0.0:$(PORT)

score:
	python $(SRC_DIR)/manage.py score
