initn:
	@docker network create ${NETWORK_DB} 2> /dev/null || true

up-db: initn
	docker-compose -f docker-compose.db.yml up -d