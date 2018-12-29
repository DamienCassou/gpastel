GITHUB_DOWNLOAD=https://raw.githubusercontent.com

# Install package-lint from github because I need:
# - 4c90df4919f7b96921a939b3bd88bedfd08d041e
# - c2bdb3668abf46d576f5728e66c551a919c0bc14
# which are not yet released.
DOWNLOAD_DEPENDENCIES=${GITHUB_DOWNLOAD}/purcell/package-lint/master/package-lint.el

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
		-O https://gitlab.petton.fr/DamienCassou/makel/raw/v0.5.0/makel.mk; \
	fi

# Include makel.mk if present
-include makel.mk
