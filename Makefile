.PHONY: install test deps

test: deps
	@vendor/minond/expect/expect test/*

lint:
	shellcheck test/* -e=SC2046
	shellcheck servies

install: deps
	ln -s $(shell pwd)/servies /usr/local/bin/servies

deps:
	@git submodule update --init --recursive
