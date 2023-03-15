import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_aplicacion/search/search_delegate.dart';
import 'package:peliculas_aplicacion/providers/movies_provider.dart';
import 'package:peliculas_aplicacion/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,// populares,
              title: 'Populares', // opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            
          ],
        ),
      )
    );
  }
}


// class HomeScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Peliculas en cines'),
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {},
//              icon: const Icon(Icons.search_outlined)
//              ),
//         ]
//         ),


//       body: const SingleChildScrollView(
//         child: Column(
//         children: [

//           //Tarjetas principales
//           CardSwiper(),

//           //Slider de peliculas
//           MovieSlider(),
//         ],
      

//       ),
//       )
//     );
//   }
// }