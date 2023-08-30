NAME=etrimaille/schemaspy-pg

VERSION=1

ifdef REGISTRY_URL
REGISTRY_PREFIX=$(REGISTRY_URL)/
BUILD_ARGS += --build-arg REGISTRY_PREFIX=$(REGISTRY_PREFIX)
endif

REPO=$(REGISTRY_PREFIX)$(NAME)

build:
	@echo "Building image"
	docker build --rm $(BUILD_ARGS) -t $(REPO):$(VERSION) -t $(REPO):latest .

push:
	docker push $(REPO):$(VERSION)
	docker push $(REPO):latest
