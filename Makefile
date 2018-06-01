IMAGE    ?= txn2/txwt
VERSION  ?= $(shell git describe --abbrev=0 --tags)
.PHONY: all

all: build

build: build-amd64 build-armhf

build-amd64:
	docker build -t $(IMAGE):$(VERSION) -f ./dockerfiles/amd64/Dockerfile .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

build-armhf:
	docker build -t $(IMAGE):armhf-$(VERSION) -f ./dockerfiles/arm/Dockerfile .
	docker push $(IMAGE):armhf-$(VERSION)