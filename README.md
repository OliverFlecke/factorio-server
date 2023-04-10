# Dockerized Factorio headless server

[![Build and publish image](https://github.com/OliverFlecke/factorio-server/actions/workflows/publish.yml/badge.svg?branch=main)](https://github.com/OliverFlecke/factorio-server/actions/workflows/publish.yml)

Repository to run a headless Factorio server.

## Build and run

To build the Docker image, use the standard `docker build .` command or with `docker compose`:

```sh
docker compose build
```

The server can then be started as a background process with

```sh
docker compose up -d
```

Anyone should then be able to join the server by giving the IP and port 34197 in the Factorio client.

## Configuration for host

Note: secrets are stored in a `.env` file to avoid commiting these to the repo for everyone to see.

In order to host multiplayer games, the server must be connected to a Factorio account.
For best pratices, supply your username in the `docker-compose.yaml` file and your account token in an `.env` file.

Secondly, a **server password** most also be provided, which is used when clients connect to the server.

### Example environment file `.env`

```sh
export TOKEN=123ac1ca1219a
export SERVER_PASSWORD=some_secret_password
export ADMIN=admin
export USERNAME=factorio_username
export SERVER_NAME="[Your Amazing Factory]"
export SERVER_DESCRIPTION="some description"
```

## Game customization

Note that the docker image must be rebuild and server restarted after changing these for changes to take affect.

In the `settings` directory multiple files for configuring the game itself can be found.
These has NOT been expose outside of the server, as to avoid duplicating everything.
Configure the `server-settings.json` file to your liking with auto saves, tags, and such.
The `map-settings.json` and `map-gen-settings.json` can be configured to create different maps to play on.

## Saves

Game saves are stored in a `saves` directory on the server.
The server is configured to save the game at a given interval (can be configured in `server-settings.json`).
If there is no default save, a new will be created, otherwise the default save will be loaded and stared with the server.
