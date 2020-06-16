# Señales y procesamiento de imágnes
Bienvenidos. Espacio creado principalmente para no ingenieros

## Qué es una señal
- Es una variación de una magnitud (por ejemplo física) en el tiempo
- Suele hablarse de señales analógicas (variación en forma continua en el tiempo) y señales digitales (solo pueden tomar unos valores puntuales)
- La representación gráfica se hace expresándola en dos ejes como S(t) en el eje vertical y t en el eje horizontal
- Los datos de una señal suelen estar en una tabla o matriz donde se encuentran los datos de los puntos de la señal (el instante en el tiempo y qué valor tiene para ese tiempo)
- Ver: [Señales y sistemas](https://books.google.com.co/books?id=g2750K3PxRYC&pg=PR31-IA2&lpg=PR31-IA2&dq=que+es+una+se%C3%B1al+variacion+ejemplos&source=bl&ots=f0RCgjgk0K&sig=ACfU3U0oTfWaeHHAtKosN1woaeUK9EIAkw&hl=es-419&sa=X&ved=2ahUKEwj4sfXt-IbqAhWSdN8KHXQnBsE4ChDoATABegQIChAB#v=onepage&q=que%20es%20una%20se%C3%B1al%20variacion%20ejemplos&f=false)

## Qué es una cuantización
- Los sistemas son finitos lo que hace que la representación de las señales deba hacerse de manera cuantizada y limitada pero suficiente para no perder información
- Para ello se habla de muestreo (tomar muestras de una señal) [Muestreando señales](https://www.investigacionyciencia.es/blogs/tecnologia/20/posts/muestreando-seales-primera-parte-10461)

## Qué es una señal continua y una señal discreta
- La continua es la analógica y la discreta es la digital
- Suele hablarse en este campo de conversores A/D (para llevar magnitudes físicas al mundo digital) o D/A (al revés) [CONVERSORES D/A Y A/D](https://www.fceia.unr.edu.ar/enica3/da-ad.pdf)

## Qué es el espacio del tiempo y el espacio de la frecuencia
- La información de la forma S(t) en t es la forma en la que se describe la magnitud física en el tiempo y se dice que la información está en el dominio del tiempo
- Pero es posible tomar una señal y representarla en lo que se llama el dominio de la frecuencia (representar la señal como una composición de otras señales en el tiempo mediante las funciones senos y cosenos)
- De la composición decimos que una señal en el tiempo solo tiene determinadas frecuencias en las que algunas tienen mayor peso que otras

## Qué es una Transformada de Fourier
- Es la operación matemática para transformar algo en el dominio del tiempo al dominio de la frecuencia

## Qué es un filtro
- Es algo que se aplica para alterar la señal (según la necesidad), por ejemplo, quitar la información de alta frecuencia en una señal

## Simuladores y aplicaciones online interactivas
- Para probar algunos conceptos [Calculadora de Fourier](https://www.mathstools.com/section/main/fourier_series_online#.XukOHaJ7k_4)

## Procesamiento de imágenes
- Son las técnicas que se aplican a las imágenes con algún propósito (extraer información, encontrar información, mejorar la calidad, etc)
- Ver la siguiente clase: [Procesamiento Digital de Imágenes](http://www.exa.unicen.edu.ar/catedras/pdi/FILES/TE/CP1.pdf)
