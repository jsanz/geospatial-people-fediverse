LISTNAME="🌏 geo"

# Ensure we have all the tools available
EXECUTABLES = echo cat grep csvcut
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

accounts.csv:
	echo "account_name" > accounts.csv
	cat ../lists.csv | grep ${LISTNAME} | csvcut -C 1 | sort >> accounts.csv

.PHONY: clean
clean:
	rm -f accounts.md accounts.csv

