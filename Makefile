.PHONY: install test

install:
	cp $(shell pwd)/servies /usr/local/bin/servies

test:
	@git submodule update --init
	@vendor/minond/expect/expect test/*
