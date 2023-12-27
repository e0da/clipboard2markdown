COMPOSE=colima nerdctl compose --
NAME=clip2md

.PHONY: all start stop build clean logs
.PHONY: start-attached start-detached logs-follow

all: start-detached

start: build
	$(COMPOSE) up $(start_args)

stop:
	$(COMPOSE) down

build:
	$(COMPOSE) build

clean: stop
	$(COMPOSE) rm

logs:
	$(COMPOSE) logs $(logs_args)

start-attached:
	make start

start-detached:
	make start start_args=--detach

logs-follow:
	make logs logs_args=-f
