PATH        := $(PATH)
SHELL       := /usr/bin/env bash
# ------------------------------------------------------------------------------
project_dir := $(notdir $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
installed   := $(TMPDIR).$(project_dir)

.PHONY: default
default: spec

.PHONY: install
install: $(installed)

$(installed): Gemfile.lock Gemfile
	@gem list bundler -i > /dev/null || gem install bundler
	@bundle install
	@touch $@

.PHONY: clean
clean:
	@rm $(installed)

.PHONY: spec
spec: $(installed)
	@bundle exec rspec spec
