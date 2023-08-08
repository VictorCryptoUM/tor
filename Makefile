all:
	docker compose -f docker-compose.yml up --build
build:
	docker compose -f docker-compose.yml build
clean:
	docker rm tor-tor-1
	docker image rm $$(docker images | grep 'tor-tor' | awk '{print $$3}')

# For usage on CI

docker_ci: build
