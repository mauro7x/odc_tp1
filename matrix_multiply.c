#include "tp1.h"

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2) {
	if ((m1->cols) != (m2->rows)) {
		fprintf(stderr,
				"ERROR: las matrices ingresadas no son multiplicables.\n");
		return NULL;
	}

	size_t n = m1->cols;
	matrix_t* m = create_matrix(n, n);

	for (size_t i = 0; i < n; ++i) {
		for (size_t j = 0; j < n; ++j) {
			double sum = 0;
			for (size_t k = 0; k < n; ++k) {
				sum += (m1->array[i * n + k] * m2->array[k * n + j]);
			}
			m->array[i * n + j] = sum;
		}
	}

	return m;
}
