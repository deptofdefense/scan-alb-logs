
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	LDFLAGS=-linkmode external -extldflags -static
endif

.PHONY: help
help: ## Print the help documentation
	@grep -E '^[\/a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

bin/big-cat: cmd/big-cat
	go build -ldflags "$(LDFLAGS)" -o bin/big-cat ./cmd/big-cat

bin/read-alb-logs: cmd/read-alb-logs
	go build -ldflags "$(LDFLAGS)" -o bin/read-alb-logs ./cmd/read-alb-logs

.PHONY: build
build: bin/big-cat bin/read-alb-logs

.PHONY: clean
clean: ## Clean all generated files
	rm -rf ./bin

default: help
