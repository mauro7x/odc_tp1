CC = gcc
CFLAGS = -g -std=c99 -Werror 
VFLAGS = --leak-check=full --track-origins=yes --show-reachable=yes

CFILES = tp0.c main.c matrix_multiply.c
HFILES = tp0.h
EXEC_S = tp0
DATOS = pruebas.txt
PRUEBAS = pruebas.sh
TEST_DIR = casos_de_prueba

build: $(CFILES)
	$(CC) $(CFLAGS) -o $(EXEC_S) $(CFILES)

run: build
	./$(EXEC_S) < $(DATOS)

valgrind: build
	valgrind $(VFLAGS) ./$(EXEC_S)

clean:
	rm -f *.o $(EXEC_S)

pruebas: build
	./$(PRUEBAS)
	
