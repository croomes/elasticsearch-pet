IMAGE_NAME=croomes/elasticsearch
IMAGE_TAG=2.4.5
REPO=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(REPO) .

push: build
	docker push $(REPO)

