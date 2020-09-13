default: build

build: proto client server

proto:
	protoc  --go_out=Mgrpc/service_config/service_config.proto=/internal/proto/grpc_service_config:. \
	--go_opt=paths=source_relative \
	helloworld/helloworld.proto
 
server: 
	go build -race -ldflags "-s -w" -o bin/server server/main.go
 
client:
	go build -race -ldflags "-s -w" -o bin/client client/main.go



.PHONY: compile server client
