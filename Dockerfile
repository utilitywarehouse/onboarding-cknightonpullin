FROM golang:1.20-alpine as builder
WORKDIR /src
COPY . ./
RUN go build -o ./bin/onboarding-cknightonpullin

FROM alpine:3.16 as release
WORKDIR /release
COPY --from=builder ./src/bin/onboarding-cknightonpullin ./
EXPOSE 8080
EXPOSE 8081
CMD ["./onboarding-cknightonpullin"]
