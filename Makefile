# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anmedyns <anmedyns@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/29 14:09:27 by anmedyns          #+#    #+#              #
#    Updated: 2024/06/25 19:09:32 by anmedyns         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = pipex

SRCS = pipex.c utili_err.c comando.c sSplit.c

OBJS = $(SRCS:.c=.o)

CC = gcc

RM = rm -rf

CFLAGS = -Wall -Werror -Wextra

.c.o:
		${CC} ${CFLAGS} -g -c $< -o ${<:.c=.o}

$(NAME):
		make -C libft/
		$(CC) $(CFLAGS) $(SRCS) -o $(NAME) libft/libft.a

all:	$(NAME)

clean:
		$(RM) $(OBJS)
		make fclean -C libft

fclean: clean
		$(RM) $(NAME)
		make fclean -C libft

git:
	git add .
	git commit -m "update"
	git push

re: 	fclean all
