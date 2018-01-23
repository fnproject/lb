# Just builds
.PHONY: all test dep build checkfmt docker-build dep-up install

dep:
	glide install

dep-up:
	glide update -v

build:
	go build -o fnlb

install:
	go build -o ${GOPATH}/bin/fnlb

checkfmt:
	go fmt -v ./...

test: checkfmt
	go test -v ./...

docker-build:
	docker build --build-arg HTTPS_PROXY --build-arg HTTP_PROXY -t fnproject/lb:latest .

all: dep build
