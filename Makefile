.PHONY: build
build: Dockerfile
	docker build -t mini-aws-cli .

.PHONY: tag
tag:
	docker tag mini-aws-cli mini/aws-cli

.PHONY: default
default: build
