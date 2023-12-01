/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/30 11:58:09 by tcharuel          #+#    #+#             */
/*   Updated: 2023/11/30 19:58:13 by tcharuel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "client.h"

void	send_char_to_server(char c, pid_t pid)
{
	int	i;

	i = 0;
	while (i < 8)
	{
		if (c & (1 << i))
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		i++;
		usleep(800);
	}
}

void	send_message_to_server(char *msg, pid_t pid)
{
	int	i;

	i = 0;
	while (msg[i])
	{
		send_char_to_server(msg[i], pid);
		i++;
	}
}

int	main(int argc, char **argv)
{
	pid_t	server_pid;

	if (argc == 3)
	{
		server_pid = ft_atoi(argv[1]);
		send_message_to_server(argv[2], server_pid);
	}
	return (0);
}
