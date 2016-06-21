# docker-protobuf3
A Docker image that can be used to compile protobufs

## Build

    docker build -t protochron/protobuf3

## Example

    docker run -v $(path_to_your_code):/code protoc --go_out=plugins=grpc:. api.proto<Paste>






