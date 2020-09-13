default: build

build: proto server

proto:
	protoc -I=proto --go_out=pkg/exec proto/exec.proto

server:
	go build -race -ldflags "-s -w" -o bin/server server/main.go

.PHONY: proto server
