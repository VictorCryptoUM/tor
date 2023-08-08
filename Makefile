all: dir
	docker compose -f docker-compose.yml up --build
build:
	docker compose -f docker-compose.yml build
clean:
	docker rm tor-tor-1
	docker image rm $$(docker images | grep 'tor-tor' | awk '{print $$3}')
dir:
	mkdir ../tor-data ../tor-log
	chown tor:tor ../tor-data
	chown tor:tor ../tor-log

# For usage on CI

docker_ci: build
