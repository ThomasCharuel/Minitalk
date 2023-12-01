/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharuel <tcharuel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/30 11:58:09 by tcharuel          #+#    #+#             */
/*   Updated: 2023/12/01 09:49:24 by tcharuel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "server.h"

void	sig_handler(int signum, siginfo_t *siginfo, void *context)
{
	static char	c = 0;
	static int	bit_i = 0;

	(void)siginfo;
	(void)context;
	if (signum == SIGUSR2)
	{
		c |= (1 << bit_i);
	}
	bit_i++;
	if (bit_i == 8)
	{
		ft_printf("%c", c);
		bit_i = 0;
		c = 0;
	}
}

int	main(void)
{
	pid_t				pid;
	struct sigaction	psa;

	pid = getpid();
	ft_printf("%d\n", pid);
	psa.sa_sigaction = &sig_handler;
	sigaction(SIGUSR1, &psa, NULL);
	sigaction(SIGUSR2, &psa, NULL);
	while (pause())
	{
	}
	return (0);
}
