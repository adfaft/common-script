# This makefile to use for rhash a folder based on extension
# available command
# - list (default) : display all command list
# - create : create a new hash file and backup old file
# - check : check hash from hashfile
# - update : update hash from hashfile for unverfied using extension (ignore missing)
# - unverified : show all unverified file list
# - missing : show all missing file list

# TODO `clean` command to remove missing file list from hash file 

# SHELL := bash
.ONESHELL:

# current directory
directory := .  
hashfile := movies.sfv
extension := .mkv,.avi,.mp4,.m4v

all: list

create:
	@echo "\n------ Will move old " $(hashfile) " to " $(hashfile) "_old if exist"
	[ ! -f $(hashfile) ] || mv $(hashfile) $(hashfile)_old
	@echo "\n------ create (new): $(hashfile) ------"
	rhash -rCP -o $(hashfile) --accept=$(extension) $(directory)
.PHONY: create

check:
	rhash -rcP --ignore-missing $(hashfile)
.PHONY: check

update:
	@echo "\n------ update : $(hashfile) ------"
	rhash -rCP --update $(hashfile) --accept=$(extension) $(directory)
.PHONY: update

unverified:
	@echo "\n------ check unverified : $(hashfile) ------"
	rhash --recursive --unverified $(hashfile) --accept=$(extension) $(directory)
.PHONY: unverified

missing:
	@echo "\n------ check missing : $(hashfile) ------"
	rhash --recursive --missing $(hashfile) --accept=$(extension) $(directory) || true
	@echo "\n------ Finished."
.PHONY: missing

list:
	@echo "------ listing all command ------"
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | grep -E -v -e '^[^[:alnum:]]' -e '^$@$$'
.PHONY: list
