REPO_ROOT := $(shell git rev-parse --show-toplevel)
include $(REPO_ROOT)/BuildTools/shared.mk

.PHONY: format
format:
	swift run -c release --package-path ./BuildTools swiftformat .
