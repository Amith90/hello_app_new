IMAGE=emotell-app
CONTAINER=emotell-app-container
PORT=80

build-container:
	echo "Initiating Docker build..."
	docker build  -t $(IMAGE) .

run: 
	docker run --rm -p $(PORT):80 --name $(CONTAINER) -d $(IMAGE)

stop:

	docker stop $(CONTAINER) || true

ssh:
	docker exec -it $(IMAGE) bash

bash:
	docker run -it --rm  $(CONTAINER) /bin/bash

rebuild: build-container restart

restart: stop run

