NAME=libasm.a

CC=nasm

SRC_NAME=	ft_strlen.s\
			ft_strcpy.s\
			ft_strcmp.s\
			ft_write.s\
			ft_read.s\
			ft_strdup.s

SRC_PATH=src/
SRC=$(addprefix $(SRC_PATH), $(SRC_NAME))

OBJS=$(SRC:.c=.o)

FLAGS=-f elf64

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	ranlib $(NAME)

$(SRC_PATH)%.o: : $(SRC_PATH)%.c
	$(CC) $(FLAGS) $(SRC_PATH)$< -o $(SRC_PATH)$@

test:
	gcc -o test test_main.c -L. -lasm

clean:
	rm $(OBJS)

fclean : clean
	rm $(NAME)

re : fclean all
