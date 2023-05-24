# TEST
test:
	go test .

# GO MOD
mod-tidy:
	go mod tidy

# DOCKER
build-docker:
	docker build -t onboarding-cknightonpullin .

run-docker: ## runs docker image on port 8080 in detached mode.
	docker run -d -p 8080:8080 --name onboarding onboarding-cknightonpullin

# ALL
all:
	@echo :: Tidying the go.mod file
	make mod-tidy
	@echo :: Testing
	make test
