# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 13:33:40 by tcharuel          #+#    #+#              #
#    Updated: 2023/12/01 14:56:43 by tcharuel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client
SERVER = server
CLIENT_BONUS = client_bonus
SERVER_BONUS = server_bonus

SOURCES_CLIENT = client.c
SOURCES_SERVER = server.c
SOURCES_CLIENT_BONUS = client_bonus.c
SOURCES_SERVER_BONUS = server_bonus.c

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
RM = rm -f
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a


all: $(CLIENT) $(SERVER)

bonus: $(CLIENT_BONUS) $(SERVER_BONUS)

$(CLIENT): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_CLIENT) -L$(LIBFT_DIR) -lft

$(SERVER): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_SERVER) -L$(LIBFT_DIR) -lft

$(CLIENT_BONUS): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_CLIENT_BONUS) -L$(LIBFT_DIR) -lft

$(SERVER_BONUS): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_SERVER_BONUS) -L$(LIBFT_DIR) -lft

$(LIBFT):
	make -C $(LIBFT_DIR)

clean:
	make -C $(LIBFT_DIR) clean

fclean: clean
	$(RM) $(CLIENT)
	$(RM) $(SERVER)
	$(RM) $(CLIENT_BONUS)
	$(RM) $(SERVER_BONUS)
	make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: $(CLIENT) $(SERVER) $(CLIENT_BONUS) $(SERVER_BONUS) all clean fclean re
