
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const CineManiaApp());
}

class CineManiaApp extends StatelessWidget {
  const CineManiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineManía',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// MODELO DE DATOS
class Pelicula {
  final String titulo;
  final String genero;
  final String descripcion;
  final String duracion;
  final double calificacion;
  final String imagen;
  final int anio;

  const Pelicula({
    required this.titulo,
    required this.genero,
    required this.descripcion,
    required this.duracion,
    required this.calificacion,
    required this.imagen,
    required this.anio,
  });
}

// DATOS DE EJEMPLO
const List<Pelicula> peliculas = [
  Pelicula(
    titulo: 'Interestelar',
    genero: 'Ciencia ficción',
    descripcion:
        'Un grupo de exploradores viaja por el espacio '
        'para buscar un nuevo hogar para la humanidad.',
    duracion: '169 min',
    calificacion: 8.7,
    imagen:
        'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    anio: 2014,
  ),
  Pelicula(
    titulo: 'Coco',
    genero: 'Animación',
    descripcion:
        'Miguel emprende una aventura en la Tierra de los Muertos '
        'para descubrir la historia de su familia.',
    duracion: '105 min',
    calificacion: 8.4,
    imagen:
        'https://image.tmdb.org/t/p/w500/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg',
    anio: 2017,
  ),
  Pelicula(
    titulo: 'Titanic',
    genero: 'Romance',
    descripcion:
        'Dos jóvenes de mundos diferentes se conocen durante '
        'un viaje en el famoso transatlántico.',
    duracion: '195 min',
    calificacion: 7.9,
    imagen:
        'https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
    anio: 1997,
  ),
  Pelicula(
    titulo: 'Intensamente',
    genero: 'Animación',
    descripcion:
        'Las emociones de una niña intentan ayudarla a adaptarse '
        'a una nueva etapa de su vida.',
    duracion: '95 min',
    calificacion: 8.1,
    imagen:
        'https://image.tmdb.org/t/p/w500/2H1TmgdfNtsKlU9jKdeNyYL5y8T.jpg',
    anio: 2015,
  ),
  Pelicula(
    titulo: 'Jurassic World',
    genero: 'Aventura',
    descripcion:
        'Un parque de dinosaurios se convierte en el escenario '
        'de una emocionante aventura.',
    duracion: '124 min',
    calificacion: 7.0,
    imagen:
        'https://image.tmdb.org/t/p/w500/A0LZHXUzo5C60Oahvt7VxvwuzHw.jpg',
    anio: 2015,
  ),
  Pelicula(
    titulo: 'Avengers: Endgame',
    genero: 'Acción',
    descripcion:
        'Los héroes se unen para intentar restaurar el equilibrio '
        'del universo después de una gran pérdida.',
    duracion: '181 min',
    calificacion: 8.4,
    imagen:
        'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    anio: 2019,
  ),
];

// PANTALLA DE BIENVENIDA
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF300000),
              Color(0xFF121212),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.movie_creation_outlined,
              color: Colors.redAccent,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'CineManía',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tu próxima película favorita te espera',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            const CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

// PANTALLA PRINCIPAL
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String busqueda = '';
  String categoria = 'Todas';

  final Set<String> favoritos = {};

  final List<String> categorias = [
    'Todas',
    'Acción',
    'Animación',
    'Aventura',
    'Romance',
    'Ciencia ficción',
  ];

  @override
  Widget build(BuildContext context) {
    final filtradas = peliculas.where((pelicula) {
      final coincideTexto = pelicula.titulo
          .toLowerCase()
          .contains(busqueda.toLowerCase());

      // CORRECCIÓN: Favoritos también debe pasar este filtro.
      final coincideCategoria =
          categoria == 'Todas' ||
          categoria == 'Favoritos' ||
          pelicula.genero == categoria;

      return coincideTexto && coincideCategoria;
    }).toList();

    // Si se selecciona Favoritos, mostramos solo los guardados.
    final resultados = categoria == 'Favoritos'
        ? filtradas
            .where((p) => favoritos.contains(p.titulo))
            .toList()
        : filtradas;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CineManía 🎬',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Mis favoritos',
            icon: Icon(
              categoria == 'Favoritos'
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            onPressed: () {
              setState(() {
                categoria = categoria == 'Favoritos'
                    ? 'Todas'
                    : 'Favoritos';
              });
            },
          ),
          IconButton(
            tooltip: 'Información',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'CineManía',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Catálogo de películas de ejemplo.',
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar una película...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (valor) {
                setState(() {
                  busqueda = valor;
                });
              },
            ),
          ),

          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final nombre = categorias[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(nombre),
                    selected: categoria == nombre,
                    onSelected: (_) {
                      setState(() {
                        categoria = nombre;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Text(
              'Descubre películas',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: resultados.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron películas.',
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      mainAxisExtent: 310,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: resultados.length,
                    itemBuilder: (context, index) {
                      final pelicula = resultados[index];

                      return Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  pelicula: pelicula,
                                  esFavorita: favoritos
                                      .contains(pelicula.titulo),
                                  alCambiarFavorito: () {
                                    setState(() {
                                      if (favoritos.contains(
                                        pelicula.titulo,
                                      )) {
                                        favoritos.remove(
                                          pelicula.titulo,
                                        );
                                      } else {
                                        favoritos.add(
                                          pelicula.titulo,
                                        );
                                      }
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.network(
                                    pelicula.imagen,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stack) {
                                      return const ColoredBox(
                                        color: Color(0xFF292929),
                                        child: Center(
                                          child: Icon(
                                            Icons.movie,
                                            size: 60,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pelicula.titulo,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      pelicula.genero,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${pelicula.calificacion}/10',
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// PANTALLA DE DETALLE
class DetailScreen extends StatefulWidget {
  final Pelicula pelicula;
  final bool esFavorita;
  final VoidCallback alCambiarFavorito;

  const DetailScreen({
    super.key,
    required this.pelicula,
    required this.esFavorita,
    required this.alCambiarFavorito,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool favorita;

  @override
  void initState() {
    super.initState();
    favorita = widget.esFavorita;
  }

  @override
  Widget build(BuildContext context) {
    final pelicula = widget.pelicula;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de película'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              pelicula.imagen,
              height: 380,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) {
                return const SizedBox(
                  height: 250,
                  child: ColoredBox(
                    color: Colors.black26,
                    child: Center(
                      child: Icon(Icons.movie, size: 80),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Text(
            pelicula.titulo,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '${pelicula.genero} • ${pelicula.anio}',
            style: const TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _dato(Icons.schedule, pelicula.duracion),
              const SizedBox(width: 22),
              _dato(
                Icons.star,
                '${pelicula.calificacion}/10',
                color: Colors.amber,
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Sinopsis',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            pelicula.descripcion,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 25),

          FilledButton.icon(
            onPressed: () {
              widget.alCambiarFavorito();

              setState(() {
                favorita = !favorita;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    favorita
                        ? 'Agregada a favoritos ❤️'
                        : 'Eliminada de favoritos',
                  ),
                ),
              );
            },
            icon: Icon(
              favorita
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            label: Text(
              favorita
                  ? 'Quitar de favoritos'
                  : 'Agregar a favoritos',
            ),
          ),
        ],
      ),
    );
  }

  Widget _dato(
    IconData icono,
    String texto, {
    Color color = Colors.white,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: color),
        const SizedBox(width: 6),
        Text(texto),
      ],
    );
  }
}
