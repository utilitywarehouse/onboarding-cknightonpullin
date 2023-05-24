IMAGETAG=onboarding-cknightonpullin

test:
	go test

clean:
 	go mod tidy

lint:
	golangci-lint run .

dev: build
	docker run $(IMAGETAG)

build:
	docker build . -t $(IMAGETAG)

install:
	go get -v ./...

all: install test