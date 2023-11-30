# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 13:33:40 by tcharuel          #+#    #+#              #
#    Updated: 2023/11/30 15:46:58 by tcharuel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client
SERVER = server

SOURCES_CLIENT = client.c
SOURCES_SERVER = server.c

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
RM = rm -f
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a


all: $(CLIENT) $(SERVER)

$(CLIENT): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_CLIENT) -L$(LIBFT_DIR) -lft

$(SERVER): $(LIBFT)
	$(CC) $(CFLAGS) -o $@ $(SOURCES_SERVER) -L$(LIBFT_DIR) -lft

$(LIBFT):
	make -C $(LIBFT_DIR)

clean:
	make -C $(LIBFT_DIR) clean

fclean: clean
	$(RM) $(CLIENT)
	$(RM) $(SERVER)
	make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: $(CLIENT) $(SERVER) all clean fclean re
