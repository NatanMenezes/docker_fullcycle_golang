FROM golang:alpine AS builder

WORKDIR /usr/src/app
RUN go mod init teste/hello_world

COPY . .

RUN go build -ldflags '-s -w' hello.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/hello .

CMD ["./hello"]