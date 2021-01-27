DOCKER_REPO  = btwiuse/substrate
DOCKER_TAG   = kitties
DOCKER_IMAGE = $(DOCKER_REPO):$(DOCKER_TAG)

build: front back

front:
	cd frontend && yarn build

back:
	cd node && cargo build --release

image:
	rm -r ./build 2>/dev/null || mkdir -p ./build/
	cp -r ./frontend/build/ ./build/dist
	cp ./node/target/release/node-template ./build/
	docker build -t $(DOCKER_IMAGE) .
	docker push $(DOCKER_IMAGE)

dev:
	docker-compose up

k8s:
	helm template chart | kubectl apply -f -
