# following https://grpc.io/docs/languages/go/quickstart

FROM golang:alpine

RUN go get \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc

# todo: figure out why sh gives "protoc not found"
# prepare protoc, can't find a docker image with this included 
# -- namely/protoc-all is closest but large and a little kludgey
##RUN apk --no-cache add curl &&\
##    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.15.5/protoc-3.15.5-linux-x86_64.zip &&\
##    unzip protoc-3.15.5-linux-x86_64.zip -d /usr/local/protoc
##ENV PATH="$PATH:/usr/local/protoc/bin"

# so that we don't have to download our dependencies for every build, includ them in the docker image.
# following https://evilmartians.com/chronicles/speeding-up-go-modules-for-docker-and-ci
# Download dependencies before build because caching this layer means it doesn't have to happen very often
COPY src/go.mod src/go.sum ./gomod/
RUN cd gomod && go mod download -x