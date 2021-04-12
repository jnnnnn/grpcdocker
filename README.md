# GRPC / golang via docker builds

## Quickstart

    docker-compose run --rm gobuild

produces a server executable in `./dist`.

if you change the .proto file:

    docker-compose run --rm goprotogen

## Development / Troubleshooting

Everything's dockerized so that new devs don't have to set up a whole lot of tooling.

The first step when debugging the build etc. is to run parts of it manually. Get to a shell in the environment with

    docker-compose run --entrypoint=sh gobuild

and if you do this, you can also use the VSCode remote shell extension to open a workspace in the container.

If you change dependencies, you will need to tell docker-compose that the image needs updating. I'm not sure why docker-compose doesn't just build every time (as everything would usually be cached) but it doesn't. Run

    docker-compose build
