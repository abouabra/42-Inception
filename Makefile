
all: start

start:
	@sudo docker compose -f src/docker-compose.yml up -d

stop:
	@sudo docker compose -f src/docker-compose.yml stop

fclean:
	@sudo docker compose -f src/docker-compose.yml down -v 
	@sudo docker system prune -af

re: fclean all