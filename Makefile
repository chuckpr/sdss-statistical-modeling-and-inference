.PHONY: build-image run-lab get-url stop-notebook

NAME = $(shell basename $(PWD))_$(shell id -u)

build-image:
	docker build -t $(shell basename $(PWD)) .

run-lab: run-lab.sh
	IMAGE=$(shell basename $(PWD)) ./$<

get-url:
	docker exec $(NAME) jupyter lab list

stop-lab:
	docker stop $(NAME) || echo "Already stopped."
