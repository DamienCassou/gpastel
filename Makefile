ELPA_DEPENDENCIES=package-lint

ELPA_ARCHIVES=melpa

LINT_CHECKDOC_FILES=gpastel.el
LINT_PACKAGE_LINT_FILES=gpastel.el
LINT_COMPILE_FILES=gpastel.el

makel.mk:
	# Download makel
	@if [ -f ../makel/makel.mk ]; then \
		ln -s ../makel/makel.mk .; \
	else \
		curl \
		--fail --silent --show-error --insecure --location \
		--retry 9 --retry-delay 9 \
		-O https://github.com/DamienCassou/makel/raw/v0.8.0/makel.mk; \
	fi

# Include makel.mk if present
-include makel.mk
