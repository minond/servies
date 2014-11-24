.PHONY: install test deps

test: deps
	@vendor/minond/expect/expect test/*

install: deps
	ln -s $(shell pwd)/servies /usr/local/bin/servies

deps:
	@git submodule update --init --recursive
