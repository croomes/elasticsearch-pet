IMAGE_NAME=gcr.io/demos-175410/croomes/elasticsearch
IMAGE_TAG=5.5.2
REPO=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(REPO) .

push: build
	gcloud docker -- push $(REPO)

