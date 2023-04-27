
build:
	docker build -t wdxxl/http-echo:v0.0.1 .
	docker inspect wdxxl/http-echo:v0.0.1 | grep Architecture

run:
	docker run -dp 8080:8080 wdxxl/http-echo:v0.0.1
	curl localhost:8080/echo