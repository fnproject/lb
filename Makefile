# Just builds
.PHONY: all test dep build test-log-datastore checkfmt pull-images api-test fn-test-utils test-middleware test-extensions test-basic test-api

dep:
	dep ensure --vendor-only

dep-up:
	dep ensure

build:
	go build -o fnlb

install:
	go build -o ${GOPATH}/bin/fnlb

checkfmt:
	go fmt -v ./...

test: checkfmt
	go test -v ./...


all: dep build
