APP := ryanrhymes/iving_prometheus

.PHONY: all
all:
	docker-compose -f bundle/docker-compose.yml up --build &

.PHONY: build
build:
	docker build -f bundle/dockerfile -t ${APP}:latest .
	docker push ${APP}:latest


.PHONY: clean
clean:
	- docker-compose -f bundle/docker-compose.yml down
	- docker rmi ${APP}

.PHONY: push
push:
	git commit -am "coding ..." && \
	git push origin `git branch | grep \* | cut -d ' ' -f2`
