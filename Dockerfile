FROM golang:1-alpine as build

WORKDIR /app
COPY cmd cmd
RUN go build cmd/hello/hello.go

FROM alpine:latest
LABEL org.opencontainers.image.source https://github.com/tekenstam/multi-arch-build

WORKDIR /app
COPY --from=build /app/hello /app/hello

EXPOSE 8180
ENTRYPOINT ["./hello"]