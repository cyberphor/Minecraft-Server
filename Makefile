.SILENT: build-and-start-server

build-and-start-server:
	docker compose -f docker/compose.yml up --build
