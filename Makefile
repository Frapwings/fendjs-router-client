REPORTER = spec
COMPONENT = ./node_modules/.bin/component

build: components index.js
	@$(COMPONENT) build --dev -o ./test

build-cov: components index.js
	@$(COMPONENT) build --dev --use component-jscoverage -o ./test

components: component.json
	@$(COMPONENT) install --dev

test: build
	@./node_modules/.bin/mocha-phantomjs ./test/index.html

test-cov: build-cov
	@./node_modules/.bin/mocha-phantomjs -R json-cov ./test/index.html > coverage.json

test-coveralls: build-cov
	echo TRAVIS_JOB_ID $(TRAVIS_JOB_ID)
	./node_modules/.bin/mocha-phantomjs -R json-cov | ./node_modules/.bin/json2lcov | ./node_modules/.bin/coveralls

clean:
	@rm -fr ./build ./components
	@rm -f ./coverage.json
	@rm -f ./test/build.js

.PHONY: clean test test-coveralls
