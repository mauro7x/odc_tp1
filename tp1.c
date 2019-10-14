#include "tp1.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define TAMANIO_BUFFER 100

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols) {

	matrix_t* m = (matrix_t*) malloc(sizeof(matrix_t));

	if (!m) {
		fprintf(stderr,
				"ERROR al reservar memoria para la creacion de la matriz.\n");
		return NULL;
	} else {
		m->array = (double*) malloc((rows * cols) * sizeof(double));
		if (!m->array) {
			free(m);
			fprintf(stderr,
					"ERROR al reservar memoria para los datos de la matriz.\n");
			return NULL;
		} else {
			m->rows = rows;
			m->cols = cols;
			return m;
		}
	}
}

// Destructor de matrix_t
void destroy_matrix(matrix_t* m) {
	if (m) {
		if (m->array != NULL)
			free(m->array);
		free(m);
		m = NULL;
	}
}

// Imprime matrix_t sobre el file pointer fp en el formato solicitado
// por el enunciado
int print_matrix(FILE* fp, matrix_t* m) {

	fprintf(fp, "%ld", m->rows);
	size_t cell_count = m->rows * m->rows;

	for (size_t i = 0; i < cell_count; ++i) {

		double n = m->array[i];

		if (n != (int) n)
			fprintf(fp, " %.2lg", n);
		else
			fprintf(fp, " %d", (int) n);
	}
	fprintf(fp, "\n");

	return 0;
}


int obtener_dimension() {
	char buffer[TAMANIO_BUFFER];
	memset(buffer, 0x00, sizeof(buffer));
	int dimension = 0;
	char c = '\0';
	int posicion = 0;

	do {
		c = fgetc(stdin);
		if ((posicion != 0)
				|| ((posicion == 0) && (c != '\n') && (c != ' ') && (c != '\t'))) {
			buffer[posicion] = c;
			++posicion;
		}
	} while ((!feof(stdin)) && (c != '\n')
			&& !((posicion != 0)
					&& ((c == ' ') || (c == '\t'))));

	if(posicion >= TAMANIO_BUFFER) return -1;

	if (sscanf(buffer, "%d", &dimension) == 1)
		return dimension;
	else
		return -1;


}

int fill_matrix(matrix_t* m1, matrix_t* m2) {

	char buffer[TAMANIO_BUFFER];
	memset(buffer, 0x00, sizeof(buffer));
	double leido_matriz = 0.00;
	char c = '\0';
	size_t posicion = 0;
	size_t cantidad_de_celdas_leidas = 0;
	size_t cantidad_de_celdas_a_leer = 2 * m1->rows * m1->rows;

	for (size_t matriz_activa = 1; matriz_activa <= 2; ++matriz_activa) {
		for (size_t i = 0; i < m1->rows; ++i) {
			for (size_t j = 0; j < m1->cols; ++j) {

				do {
					c = fgetc(stdin);
					if ((posicion != 0)
							|| ((posicion == 0) && (c != '\n') && (c != ' ')
									&& (c != '\t'))) {
						buffer[posicion] = c;
						++posicion;
					}
				} while ((!feof(stdin)) && (c != '\n')
						&& !((posicion != 0)
								&& ((c == ' ') || (c == '\t'))) && (posicion < TAMANIO_BUFFER));

				if (sscanf(buffer, "%lg", &leido_matriz) == 1) {
					++cantidad_de_celdas_leidas;
					if (cantidad_de_celdas_leidas
							<= cantidad_de_celdas_a_leer) {
						if (matriz_activa == 1)
							m1->array[(i * m1->cols) + j] = leido_matriz;
						else
							m2->array[(i * m1->cols) + j] = leido_matriz;
					} else {
						fprintf(stderr, "ERROR: Demasiados datos de entrada\n");
						return EXIT_FAILURE;
					}
				}

				
				if(posicion >= TAMANIO_BUFFER) return EXIT_FAILURE;

				if ((c == '\n') || (feof(stdin))) {
					if (cantidad_de_celdas_leidas < cantidad_de_celdas_a_leer) {
						fprintf(stderr, "ERROR: Faltan datos de entrada.\n");
						return EXIT_FAILURE;
					} else {
						return EXIT_SUCCESS;
					}
				}


				memset(buffer, 0x00, posicion);
				posicion = 0;
				c = '\0';

			}
		}
	}

	// Hay mas caracteres para leer en la linea, pero hay que revisar si son whitespaces
	do {
		c = fgetc(stdin);
	} while ((!feof(stdin)) && ((c == ' ') || (c == '\t')) && (posicion < TAMANIO_BUFFER));

	if ((c == '\n') || (feof(stdin))) {
		return EXIT_SUCCESS;
	} else {
		fprintf(stderr, "ERROR: Demasiados datos de entrada.\n");
		return EXIT_FAILURE;
	}
}
