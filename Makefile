all:
	docker compose -f docker-compose.yml up --build
build:
	docker compose -f docker-compose.yml build


# For usage on CI

docker_ci: build