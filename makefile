.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependency
	poetry install
	poetry update

.PHONY: pocket
pocket: ## Get all pocket
	poetry run pocket-to-sqlite fetch pocket.db


.PHONY: github
github: ## Get all github data
	poetry run github-to-sqlite starred github.db fundor333
	poetry run github-to-sqlite repos github.db fundor333 --readme

.PHONY: twitter
twitter: ## Get all github data
	poetry run twitter-to-sqlite user-timeline twitter.db
	poetry run twitter-to-sqlite followers twitter_followers.db
	poetry run twitter-to-sqlite favorites twitter_favorites.db

.PHONY: all
all: swarm pocket github twitter ## All update
