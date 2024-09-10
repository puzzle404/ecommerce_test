#  👋 Buy-Bye 👋

## Pre-requisites

* Docker: The project is built in docker (https://docs.docker.com/get-docker/) so you'll need it installed in your machine before starting
* your text editor / IDE of choice

## Instructions

After extracting the project files, cd into the project's dir and run:

```bash
$ docker-compose up --build
$ docker-compose run --rm web bundle install
$ docker-compose run --rm web rails db:create db:migrate db:seed
```

To start the development server:

```bash
$ docker-compose up
```

you should be able to access the app at http://localhost:3000

To stop all the containers:

```bash
$ docker-compose down
```
