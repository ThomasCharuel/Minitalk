# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 13:33:40 by tcharuel          #+#    #+#              #
#    Updated: 2023/11/30 12:48:47 by tcharuel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client
SERVER = server

SOURCES_CLIENT = client.c
SOURCES_SERVER = server.c

OBJECTS_CLIENT = $(SOURCES_CLIENT:.c=.o)
OBJECTS_SERVER = $(SOURCES_SERVER:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
RM = rm -f
LIBFT_DIR = libft/
LIBFT = libft.a


all: $(CLIENT) $(SERVER)

$(CLIENT): $(LIBFT) $(OBJECTS_CLIENT)
	$(CC) $(CFLAGS) $(OBJECTS_CLIENT) -o $(CLIENT)

$(SERVER): $(LIBFT) $(OBJECTS_SERVER)
	$(CC) $(CFLAGS) $(OBJECTS_SERVER) -o $(SERVER)

$(LIBFT):
	make -C $(LIBFT_DIR)
	cp $(LIBFT_DIR)$(LIBFT) $(LIBFT)

.c.o:
	$(CC) $(CFLAGS) -I. -Ilibft -c $< -o ${<:.c=.o}

clean:
	$(RM) $(OBJECTS_CLIENT) $(OBJECTS_SERVER) $(LIBFT)
	make -C $(LIBFT_DIR) clean

fclean: clean
	$(RM) $(CLIENT)
	$(RM) $(SERVER)
	make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: $(CLIENT) $(SERVER) all clean fclean re
