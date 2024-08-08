NAME = libftprintf.a
LIBFT = ./libft/libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
INCLUDE = -I ./libft
SRCS = ft_printf.c ft_putchar.c ft_print_str.c ft_print_num.c ft_print_unsigned_num.c ft_print_hexadeci.c \
ft_print_pointer.c
OBJS = ${SRCS:.c=.o}

all: ${NAME} ${LIBFT}


${NAME}: ${OBJS}
	@${MAKE} -C ./libft
	@cp ${LIBFT} ${NAME}
	ar rcs ${NAME} ${OBJS}

%.o: %.c
	${CC} ${CFLAGS} ${INCLUDE} -c $< -o $@

clean:
	rm -f ${OBJS}
	$(MAKE) clean -C ./libft

fclean: clean
	rm -f ${NAME}
	$(MAKE) fclean -C ./libft

re: fclean all

.PHONY: clean fclean re all