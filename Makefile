test:
	go test .

mod-tidy:
	go mod tidy

build-docker:
	docker build -t onboarding-cknightonpullin .

run-docker:
	docker run -d -p 8080:8080 --name onboarding onboarding-cknightonpullin
	
all:
	make mod-tidy
	make test
