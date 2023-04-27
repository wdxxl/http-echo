
build:
	docker build -t wdxxl/http-echo:v0.0.2 .
	docker inspect wdxxl/http-echo:v0.0.2 | grep Architecture

run:
	docker run -dp 8080:8080 wdxxl/http-echo:v0.0.2
	curl localhost:8080/echo

push:
	docker push wdxxl/http-echo:v0.0.2
