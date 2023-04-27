VER = "v0.0.4"

prepare:  # for first run
	docker buildx create --name xbuilder --driver docker-container --use

build:
	docker build -t wdxxl/http-echo:$(VER) .
	docker inspect wdxxl/http-echo:$(VER) | grep Architecture

run:
	docker run --rm -p 8080:8080 wdxxl/http-echo:$(VER)
	curl localhost:8080/echo

push:
	docker buildx build . -f Dockerfile -t wdxxl/http-echo:$(VER) --platform linux/arm64,linux/amd64 --push
