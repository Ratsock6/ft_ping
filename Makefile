SRC			= src/main.c

OBJ 		= $(SRC:.c=.o)

CC 			= cc
CFLAGS 		= -Wall -Wextra -Werror -g

NAME 		= ft_ping

all: $(NAME)

$(NAME): $(OBJ) #$(LIBGNL)
	$(CC) $(CFLAGS) $^ -o $(NAME) $(LDFLAGS)
	

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

debug: fclean
	$(MAKE) DEBUG=1 all

clean: 
	if [ -d "$(FT)" ]; then $(MAKE) clean -C $(FT); fi
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

clear:
	$(RM) -r $(FT)
	$(RM) -r $(GNL)

re: fclean all

.PHONY: all debug clean fclean clear re
