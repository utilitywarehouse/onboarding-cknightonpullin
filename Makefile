# TEST
test:
	go test .

# GO MOD
mod-tidy:
	go mod tidy

# LINT
install-linter: ## install go linters.
	@ [ -e ./bin/golangci-lint ] || wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s latest

lint:
	golangci-lint run

# DOCKER
build-docker:
	docker build -t onboarding-cknightonpullin .

run-docker: ## runs docker image on port 8080 in detached mode.
	docker run -d -p 8080:8080 --name onboarding onboarding-cknightonpullin

# ALL
all:
	@echo :: Tidying the go.mod file
	make mod-tidy
	@echo :: Linting
	make lint
	@echo :: Testing
	make test
