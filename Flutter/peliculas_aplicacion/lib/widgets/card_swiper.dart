
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas_aplicacion/models/models.dart';


class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    Key? key, 
    required this.movies
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if( this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

  

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index ) {

          final movie = movies[index];

          movie.heroId = 'swiper-${ movie.id }';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage( movie.fullPosterImg ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}

// class CardSwiper extends StatelessWidget {
//   const CardSwiper({super.key, required List<Movie> movies});

//   @override
//   Widget build(BuildContext context) {
    
//     final size = MediaQuery.of(context).size;

//     return Container(
//       width: double.infinity,
//       height: size.height * 0.5,
//       //color: Colors.red,
//       child: Swiper(
//         itemCount: 10, //Cantidad de tarjetas que se manejan
//         layout: SwiperLayout.STACK,
//         itemWidth: size.width * 0.6,
//         itemHeight: size.height * 0.9,
//         itemBuilder: (BuildContext context, int index){

//           return GestureDetector(
//             onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: const FadeInImage(
//                 placeholder: AssetImage('assets/no-image.jpg'), 
//                 image: NetworkImage('https://via.placeholder.com/300x400'),
//                 fit: BoxFit.cover,
//                 ),
//             ),
//           );
//         }
//         ),
//     );
//   }
// }