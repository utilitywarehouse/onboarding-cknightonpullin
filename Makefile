IMAGETAG=onboarding-cknightonpullin

test:
	go test

clean:
 	go mod tidy

dev: build
	docker run $(IMAGETAG)

build:
	docker build . -t $(IMAGETAG)

install:
	go get -v ./...

all:
	@echo :: Tidying the go.mod file
	make mod-tidy
	@echo :: Testing
	make test
