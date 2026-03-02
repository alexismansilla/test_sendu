.PHONY: setup up down bash console db-create db-migrate rspec logs build

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

bash:
	docker-compose run --rm web bash

console:
	docker-compose run --rm web rails console

db-create:
	docker-compose run --rm web bundle exec rails db:create

db-migrate:
	docker-compose run --rm web bundle exec rails db:migrate

rspec:
	docker-compose run --rm web bundle exec rspec

logs:
	docker-compose logs -f web

setup:
	@echo "Generando aplicación Rails 5.2.2.1 dentro de Docker..."
	docker-compose run --rm web rails new . --force --database=postgresql --skip-bundle
	docker-compose build
	@echo "Instalando dependencias de nuevo con el nuevo Gemfile..."
	docker-compose run --rm web bundle install
	@echo "Configurando la BD..."
	docker-compose run --rm web bundle exec rails db:create db:migrate
	@echo "¡Configuración lista! Usa 'make up' para leventar el servidor."
