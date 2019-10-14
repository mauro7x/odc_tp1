CC = gcc
CFLAGS = -g -std=c99 -Werror 
VFLAGS = --leak-check=full --track-origins=yes --show-reachable=yes

CCOMPILATION = tp1.c main.c matrix_multiply.c
SCOMPILATION = tp1.c main.c matrix_multiply.S
HFILES = tp1.h
EXEC_S = tp1
PRUEBAS = pruebas.sh
TEST_DIR = casos_de_prueba

build: $(SCOMPILATION)
	$(CC) $(CFLAGS) -o $(EXEC_S) $(SCOMPILATION)

buildc: $(CCOMPILATION)
	$(CC) $(CFLAGS) -o $(EXEC_S) $(CCOMPILATION)

valgrind: build
	valgrind $(VFLAGS) ./$(EXEC_S)

clean:
	rm -f *.o $(EXEC_S)

pruebas: build
	./$(PRUEBAS)
	
