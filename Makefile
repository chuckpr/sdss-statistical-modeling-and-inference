.PHONY: build-image run-lab get-url stop-notebook

NAME = $(shell basename $(PWD))_$(shell id -u)

build-image:
	docker build -t $(shell basename $(PWD)) .

run-lab: run-notebook.sh
	IMAGE=$(shell basename $(PWD)) ./$<

get-url:
	docker exec $(NAME) jupyter notebook list | sed 's/0\.0\.0\.0/localhost/'

stop-notebook:
	docker stop $(NAME) || echo "Already stopped."
