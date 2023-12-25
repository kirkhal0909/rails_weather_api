init:
	cp .env.test .env;

build:
	docker-compose --env-file .env build

db_init:
	docker-compose --env-file .env run web rake RAILS_ENV=production db:create db:migrate

up:
	docker-compose --env-file .env up -d

down:
	docker-compose down
