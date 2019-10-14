echo "=================================="
echo "              PRUEBAS"
echo "=================================="
echo -e "\nEjecutando las pruebas contenidas en ./casos_de_prueba/..."

echo -e "\n00_archivo_vacio.txt"
./tp1 < ./casos_de_prueba/00_archivo_vacio.txt

echo -e "\n01_un_producto_en_2_dim.txt"
./tp1 < ./casos_de_prueba/01_un_producto_en_2_dim.txt

echo -e "\n02_dos_productos_en_2_dim.txt"
./tp1 < ./casos_de_prueba/02_dos_productos_en_2_dim.txt

echo -e "\n03_un_producto_en_3_dim.txt"
./tp1 < ./casos_de_prueba/03_un_producto_en_3_dim.txt

echo -e "\n04_dos_productos_en_3_dim.txt"
./tp1 < ./casos_de_prueba/04_dos_productos_en_3_dim.txt

echo -e "\n05_punto_flotante_en_2_dim.txt"
./tp1 < ./casos_de_prueba/05_punto_flotante_en_2_dim.txt

echo -e "\n06_matriz_uno_incompleta.txt"
./tp1 < ./casos_de_prueba/06_matriz_uno_incompleta.txt

echo -e "\n07_matriz_dos_incompleta.txt"
./tp1 < ./casos_de_prueba/07_matriz_dos_incompleta.txt

echo -e "\n08_demasiadas_celdas.txt"
./tp1 < ./casos_de_prueba/08_demasiadas_celdas.txt

echo -e "\n09_matriz_uno_incompleta_con_mas_lineas.txt"
./tp1 < ./casos_de_prueba/09_matriz_uno_incompleta_con_mas_lineas.txt

echo -e "\n10_matriz_dos_incompleta_con_mas_lineas.txt"
./tp1 < ./casos_de_prueba/10_matriz_dos_incompleta_con_mas_lineas.txt

echo -e "\n11_demasiadas_celdas_con_mas_lineas.txt"
./tp1 < ./casos_de_prueba/11_demasiadas_celdas_con_mas_lineas.txt

echo -e "\n12_matrices_con_muchos_whitespaces.txt"
./tp1 < ./casos_de_prueba/12_matrices_con_muchos_whitespaces.txt

echo -e "\n13_matrices_con_muchos_whitespaces_con_mas_lineas.txt"
./tp1 < ./casos_de_prueba/13_matrices_con_muchos_whitespaces_con_mas_lineas.txt

echo -e "\n14_demasiadas_celdas_en_linea_central.txt"
./tp1 < ./casos_de_prueba/14_demasiadas_celdas_en_linea_central.txt

echo -e "\n15_matriz_uno_incompleta_en_linea_central.txt"
./tp1 < ./casos_de_prueba/15_matriz_uno_incompleta_en_linea_central.txt

echo -e "\n16_matriz_dos_incompleta_en_linea_central.txt"
./tp1 < ./casos_de_prueba/16_matriz_dos_incompleta_en_linea_central.txt
echo -e "\n\nEjecucion de pruebas finalizada."
echo "=================================="
