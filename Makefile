SHELL := /bin/bash

SOURCES = $(shell find src/ -iname "*.py")
VERSION = $(shell cat VERSION | head -n 1)

# make dist-clean
#  Effectively a git reset --hard HEAD; Removes everything that isn't checked in.
dist-clean: clean
	git reset --hard HEAD
	git clean -df

clean:
	docker rmi puppetserver:$(VERSION)

.PHONY: dist-clean docker docker-up

docker:
	@docker build -t puppetserver:$(VERSION) ./
	@docker tag -f puppetserver:$(VERSION) puppetserver:latest

docker-up: docker
	@docker-compose rm --force
	@docker-compose up
