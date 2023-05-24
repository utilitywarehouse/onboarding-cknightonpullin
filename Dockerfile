FROM golang:1.20-alpine as builder

# Dependencies
RUN --mount=type=cache,target=/var/cache/apk \
    apk add --no-cache git gcc musl-dev

WORKDIR /build

# Allow access to private dependencies
ARG GITHUB_USER
ARG GITHUB_TOKEN
RUN git config --global url."https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com".insteadOf "https://github.com"
ENV GOPRIVATE=github.com/utilitywarehouse/*

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /app .

FROM alpine
COPY --from=builder /app /app

ENTRYPOINT ["/app"] 