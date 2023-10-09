
all: ascci_art start

start:
	@mkdir -p /home/ayman/data/wordpress /home/ayman/data/mariadb
	@sudo docker compose -f src/docker-compose.yml up -d --build

stop:
	@sudo docker compose -f src/docker-compose.yml stop

fclean:
	@sudo docker compose -f src/docker-compose.yml down -v 
#@sudo docker system prune -af
	@sudo rm -rf /home/ayman/data/

re: fclean all

RED = \033[1;31m
GREEN = \033[1;32m
BLUE = \033[1;34m
YELLOW = \033[1;33m
BLINK = \033[5m
RESET = \033[0m

ascci_art:
	@clear
	@printf "$(BLINK)$(GREEN)                                                                                               								      \n\
                                                                                                                                                          \n\
                                                                                                        \n\
        #####  #                                                                                        \n\
     ######  /                                                            #                             \n\
    /#   /  /                                                     #      ###                            \n\
   /    /  /                                                     ##       #                             \n\
       /  /                                                      ##                                     \n\
      ## ##      ###  /###       /###       /##       /###     ######## ###        /###    ###  /###    \n\
      ## ##       ###/ #### /   / ###  /   / ###     / ###  / ########   ###      / ###  /  ###/ #### / \n\
    /### ##        ##   ###/   /   ###/   /   ###   /   ###/     ##       ##     /   ###/    ##   ###/  \n\
   / ### ##        ##    ##   ##         ##    ### ##    ##      ##       ##    ##    ##     ##    ##   \n\
      ## ##        ##    ##   ##         ########  ##    ##      ##       ##    ##    ##     ##    ##   \n\
 ##   ## ##        ##    ##   ##         #######   ##    ##      ##       ##    ##    ##     ##    ##   \n\
###   #  /         ##    ##   ##         ##        ##    ##      ##       ##    ##    ##     ##    ##   \n\
 ###    /          ##    ##   ###     /  ####    / ##    ##      ##       ##    ##    ##     ##    ##   \n\
  #####/           ###   ###   ######/    ######/  #######       ##       ### /  ######      ###   ###  \n\
    ###             ###   ###   #####      #####   ######         ##       ##/    ####        ###   ### \n\
                                                   ##                                                   \n\
                                                   ##                                                   \n\
                                                   ##                               By: abouabra        \n\
                                                    ##                                                  \n\
                                                                                                                                                          \n\
                                                                                                                                                          \n$(RESET)"
.PHONY: all start stop clean fclean re ascci_art