DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CADIDATE := $(wildcard .??*)
EXCLUSIONS := .git

DOTFILES := $(filter-out $(EXCLUSIONS), $(CADIDATE))

.DEFAULT_GOAL := help

.PHONY: install help

list: ## Show install dotfiles
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Create symlink to home directory
	@echo "this is test"


help: ## self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' 
