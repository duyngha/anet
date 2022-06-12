# Anet
Build a simple network for your system based on Docker

## Installation
- Download the repository
- Create `Makefile` from `Makefile.example`
- Modify your docker-compose.app.yml
- Make `.env` from `.env.example`

## How to use
### Create the network and database for your system
`make init`

### Build your app
`make build-app`

### Start your app
`make start-app`

### Restart your app
`make restart-app`

### Down your app
`make down-app`

## [Changelog](CHANGELOG.md)

## License
MIT
