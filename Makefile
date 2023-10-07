
all: start

start:
	@rm -rf /home/ayman/Documents/42/data
	@mkdir -p /home/ayman/Documents/42/data/wordpress /home/ayman/Documents/42/data/mariadb
	@sudo docker compose -f src/docker-compose.yml up -d

stop:
	@sudo docker compose -f src/docker-compose.yml stop

fclean:
	@sudo docker compose -f src/docker-compose.yml down -v 
	@sudo docker system prune -af

re: fclean all