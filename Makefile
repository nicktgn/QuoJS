MIN = uglifyjs
GRUNT = grunt
FILE_LIST = quo.js quo.ajax.js quo.css.js quo.element.js quo.environment.js quo.events.js quo.gestures.js quo.output.js quo.query.js

OPTIONS = -c -m toplevel -b beautify=false 

all: dist/quo.js

node_modules:
	npm install

build/quo.js: node_modules
	-$(GRUNT)

dist:
	mkdir dist

dist/quo.debug.js: dist build/quo.js
	cd build && cat $(FILE_LIST) > ../dist/quo.debug.js

dist/quo.js: dist/quo.debug.js
	$(MIN) dist/quo.debug.js -o dist/quo.js $(OPTIONS)

clean:
	rm dist/quo.js dist/quo.debug.js
