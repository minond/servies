.PHONY: install test deps

dependencies:
	@git submodule update --init --recursive

install: dependencies
	ln -s $(shell pwd)/servies /usr/local/bin/servies

test: dependencies
	@vendor/minond/expect/expect test/*

lint:
	shellcheck test/* -e=SC2046
	shellcheck servies
