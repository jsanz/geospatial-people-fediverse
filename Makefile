LISTNAME="FOSS4G & Geospatial"

# Ensure we have all the tools available
EXECUTABLES = echo cat grep csvtomd
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

geospatial-people-fediverse.csv:
	echo "listname, account" > geospatial-people-fediverse.csv
	cat ../lists.csv | grep ${LISTNAME} >> geospatial-people-fediverse.csv

geospatial-people-fediverse.md: geospatial-people-fediverse.csv
	cat geospatial-people-fediverse.csv | csvtomd > geospatial-people-fediverse.md

.PHONY: clean
clean:
	rm -f geospatial-people-fediverse.md geospatial-people-fediverse.csv

