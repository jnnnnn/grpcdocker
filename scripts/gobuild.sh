#!/bin/sh


# windows build
echo "Running windows build..."
GOOS="windows" go build -ldflags '-w' -o /dist/onevue-bridge.exe
echo "Windows build complete"

# linux build
#GOOS=linux go build -ldflags '-w -extldflags "-static" -X main.BuildVersion='${VERSION} -o /dist/${APP_NAME}-linux-${VERSION}
