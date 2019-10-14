#ifndef TP1_H_
#define TP1_H_

#include <stdio.h>

//Tipo de la matriz
typedef struct matrix {
	size_t rows;
	size_t cols;
	double* array;
} matrix_t;

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols);

// Destructor de matrix_t
void destroy_matrix(matrix_t* m);

// Multiplica las matrices en m1 y m2
matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);

// Imprime matrix_t sobre el file pointer fp en el formato solicitado por el enunciado
int print_matrix(FILE* fp, matrix_t* m);

// Llenas la dos matrices con datos del standard input.
int fill_matrix(matrix_t* m1, matrix_t* m2);

// Lee de la entrada estandar la dimension de la matriz.
int obtener_dimension();

#endif /* TP1_H_ */
