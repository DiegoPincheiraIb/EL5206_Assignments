**ES**:

El objetivo de esta Actividad de Laboratorio es implementar y analizar algoritmos simples de clasificación de personas usando información periocular. Los archivos ojos_gal.zip y ojos_test.zip contienen las imágenes necesarias para construir los conjuntos de galería y prueba respectivamente.


1. Implemente el algoritmo de análisis de textura LBP usando una matriz de 3x3. Aplique LBP a todas las imágenes de ojos disponibles y guarde los resultados. ¿Qué características tienen las imágenes procesadas con LBP?

2. Desarrolle un algoritmo para extraer un vector de características para cada imagen. Para ello divida
la imagen de entrada en 30 regiones de 100x100 pixeles (ancho x alto) y a cada una de ellas calcúlele
un histograma cuantizado en 59 puntos. Concatene los 25 histogramas conseguidos en un vector de
dimensiones 1x1770 que será el elemento de salida al método de extracción de características.
3.Implemente la siguiente medida de distancia entre dos vectores de largo n:

4. Construya una base de datos usando las imágenes del archivo ojos_gal.zip. Esto incluye procesar las
imágenes usando LBP, la posterior extracción y almacenamiento del vector de características para
cada una de ellas.

5. Realice una prueba de reconocimiento de cada imagen del archivo ojos_test.zip. Para ello debe
procesar cada imagen mediante LBP, extraer el vector de características y compararlo con cada uno
de los almacenados en la base de datos usando como medida de similitud la distancia programada.
¿Cuántos reconocimientos correctos se obtienen?

6. ¿Qué pasaría si se tiene como entrada al sistema una imagen de ojo de un individuo que no está en
la base de datos? ¿Qué estrategia implementaría para enfrentar dicho problema? Pruebe su
estrategia usando las imágenes del archivo ojos_impostor.zip. Identifique al falso impostor, es decir,
a la persona que está en la carpeta ojos_impostor y en la carpeta ojos_gal, explique el criterio utilizado
para detectarlo.
