.PHONY: dependencies install test lint

dependencies:
	@git submodule update --init --recursive

install: dependencies
	ln -s $(shell pwd)/servies /usr/local/bin/servies

test: dependencies
	@vendor/minond/expect/expect test/*

lint:
	shellcheck servies
	shellcheck servies test/* -e SC2046 -e SC2148

sample:
	@DEBUG=* ./servies sample.sh
