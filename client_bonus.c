/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/30 11:58:09 by tcharuel          #+#    #+#             */
/*   Updated: 2023/12/01 14:54:53 by tcharuel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "client_bonus.h"

int static	g_ack_received = 0;

void	send_char_to_server(char c, pid_t pid)
{
	int	i;

	i = 0;
	while (i < 8)
	{
		g_ack_received = 0;
		if (c & (1 << i))
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		while (!g_ack_received)
			usleep(1000);
		i++;
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

void	sig_handler(int signum)
{
	if (signum == SIGUSR1)
		g_ack_received = 1;
}

int	main(int argc, char **argv)
{
	pid_t	server_pid;

	signal(SIGUSR1, &sig_handler);
	if (argc == 3)
	{
		server_pid = ft_atoi(argv[1]);
		send_message_to_server(argv[2], server_pid);
	}
	return (0);
}
