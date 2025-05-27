# This makefile to use for rsync a folder
# available command
# - list (default) : display all command list
# - sync : create a new hash file and backup old file
# - dry-run : check hash from hashfile

# TODO `clean` command to remove missing file list from hash file 

# SHELL := bash
.ONESHELL:

# current directory
source_dir := .  
destination_dir := copy/
logs := logs.txt

all: list

sync:
	rsync -avhP $(source_dir) $(destination_dir) | tee create-$(logs)`
.PHONY: sync

dry-run:
	rsync -anvhP $(source_dir) $(destination_dir) | tee dry-run-$(logs)`
.PHONY: dry-run


list:
	@echo "------ listing all command ------"
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | grep -E -v -e '^[^[:alnum:]]' -e '^$@$$'
.PHONY: list