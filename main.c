#include "tp1.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define VERSION_NUMBER 1.0

#define HELP "-h"
#define HELP_COMPLETE "--help"

#define VERSION "-V"
#define VERSION_COMPLETE "--version"

#define CONTINUAR 2

#define MODO_DE_USO "Usage:\n \t tp0 -h \n \t tp0 -V \n \t tp0 < in_file > out_file \nOptions: \n \t -V, --version \t Print version and quit.\n \t -h, --help \t Print this information and quit. \nExamples: \n \t tp0 < in.txt > out.txt \n \t cat in.txt | tp0 > out.txt\n"

#define DIMENSION_NO_VALIDA "ERROR: Dimensión de la matriz no válida.\n"
#define OPCION_INVALIDA "ERROR: Invalid option.\n"

int validar_argumentos(int argc, char ** argv) {

	switch (argc) {
	case 1:
		return CONTINUAR;

	case 2:
		if (strncmp(argv[1], HELP, sizeof(HELP)) == 0
				|| strncmp(argv[1], HELP_COMPLETE, sizeof(HELP_COMPLETE)) == 0) {
			fprintf(stdout, MODO_DE_USO);
		    return EXIT_SUCCESS;
        } else if (strncmp(argv[1], VERSION, sizeof(VERSION)) == 0
				|| strncmp(argv[1], VERSION_COMPLETE, sizeof(VERSION_COMPLETE))
						== 0) {
			fprintf(stdout, "Version %.1f\n", VERSION_NUMBER);
    		return EXIT_SUCCESS;
        } else {
		    fprintf(stderr, OPCION_INVALIDA);
		    fprintf(stderr, MODO_DE_USO);
		    return EXIT_FAILURE;
        }

	default:
		fprintf(stderr, OPCION_INVALIDA);
		fprintf(stderr, MODO_DE_USO);
		return EXIT_FAILURE;
	}
}

int main(int argc, char *argv[]) {

    int res = validar_argumentos(argc, argv);

    switch (res) {
        case EXIT_FAILURE:
            return EXIT_FAILURE;
        case EXIT_SUCCESS:
            return EXIT_SUCCESS;
    }

	matrix_t* m1 = NULL;
	matrix_t* m2 = NULL;
	matrix_t* m3 = NULL;

	while (!feof(stdin)) {

		int dimension = obtener_dimension();

		if (dimension <= 0) {
		    fprintf(stderr, DIMENSION_NO_VALIDA);
			return EXIT_FAILURE;
        }

		m1 = create_matrix(dimension, dimension);
		m2 = create_matrix(dimension, dimension);

		if (m1 && m2) {

			if (fill_matrix(m1, m2) == EXIT_SUCCESS) {

				m3 = matrix_multiply(m1, m2);

				destroy_matrix(m1);
				destroy_matrix(m2);

				if (m3) {
					print_matrix(stdout, m3);
					destroy_matrix(m3);
				} else {
					return EXIT_FAILURE;
				}
			} else {
				destroy_matrix(m1);
				destroy_matrix(m2);
				return EXIT_FAILURE;
			}

		} else {
			destroy_matrix(m1);
			destroy_matrix(m2);
			return EXIT_FAILURE;
		}
	}

	return EXIT_SUCCESS;
}
