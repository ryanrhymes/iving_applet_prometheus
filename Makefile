APP := ryanrhymes/iving_grafana

.PHONY: all
all:
	docker-compose up --build

.PHONY: build
build:
	docker build -f dockerfile -t ${APP}:latest .
	docker push ${APP}:latest


.PHONY: clean
clean:
	- docker-compose down
	- docker rmi ${APP}

.PHONY: push
push:
	git commit -am "coding ..." && \
	git push origin `git branch | grep \* | cut -d ' ' -f2`
