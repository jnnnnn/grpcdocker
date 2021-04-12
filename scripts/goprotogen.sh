#!/bin/sh

echo "Generating go bindings from .proto file.."
protoc \
        --go_out=. --go_opt=paths=source_relative \
        --go-grpc_out=. --go-grpc_opt=paths=source_relative \
        --proto_path=/opt/include \
        --proto_path=/hogwarts \
    wealthti.proto
echo "Done"