LISTNAME="🌏 geo"

# Ensure we have all the tools available
EXECUTABLES = echo cat grep csvtomd
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

accounts.csv:
	echo "listname, account" > accounts.csv
	cat ../lists.csv | grep ${LISTNAME} | sort >> accounts.csv

accounts.md: accounts.csv
	cat accounts.csv | csvtomd > accounts.md

.PHONY: clean
clean:
	rm -f accounts.md accounts.csv

