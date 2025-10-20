GO_CMD = go
GO_TEST_FLAGS = -v -count=1 -cover

.PHONY: test clean fmt lint

test: lint
	$(GO_CMD) test $(GO_TEST_FLAGS) ./...

clean:
	$(GO_CMD) clean -cache
	$(GO_CMD) clean
	rm -rf ./build

fmt:
	$(GO_CMD) fmt ./...

lint: fmt
	golangci-lint run
