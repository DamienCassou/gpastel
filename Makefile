SRCS = gpastel.el

LOAD_PATH = -L . -L ../package-lint

EMACSBIN ?= emacs
BATCH     = $(EMACSBIN) -Q --batch $(LOAD_PATH) \
		--eval "(setq load-prefer-newer t)" \
		--eval "(require 'package)" \
		--eval "(add-to-list 'package-archives '(\"melpa-stable\" . \"http://stable.melpa.org/packages/\"))" \
		--eval "(setq enable-dir-local-variables nil)" \
		--funcall package-initialize

CURL = curl -fsSkL --retry 9 --retry-delay 9

.PHONY: all ci-dependencies check lint

all: check

ci-dependencies:
	# Install package-lint from github because I need
	# https://github.com/purcell/package-lint/pull/115 which has
	# been merged but not released.
	$(CURL) -O https://raw.githubusercontent.com/purcell/package-lint/master/package-lint.el

check: lint

lint :
	# Byte compile all and stop on any warning or error
	$(BATCH) \
	--eval "(setq byte-compile-error-on-warn t)" \
	-f batch-byte-compile ${SRCS}

	# Run package-lint to check for packaging mistakes
	$(BATCH) \
	--eval "(require 'package-lint)" \
	-f package-lint-batch-and-exit ${SRCS}
