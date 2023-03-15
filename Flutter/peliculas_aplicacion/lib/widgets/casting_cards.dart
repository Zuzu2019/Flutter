import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_aplicacion/models/models.dart';
import 'package:peliculas_aplicacion/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards( this.movieId );

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: ( _, AsyncSnapshot<List<Cast>> snapshot) {
        
        if( !snapshot.hasData ) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only( bottom: 30 ),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _, int index) => _CastCard( cast[index] ),
          ),
        );

      },
    );

    
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard( this.actor );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage( actor.fullProfilePath ),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox( height: 5 ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// class CastingCards extends StatelessWidget {
//   CastingCards(int id);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 30),
//       width: double.infinity,
//       height: 180,
//       color: Colors.red,
//       child: ListView.builder(
//         itemCount: 10,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (_ , int index) => _CastCard() 
//         )
//     );
//   }
// }

// class _CastCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       width: 110,
//       height: 100,
//       color: Colors.green,
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: const FadeInImage(
//               placeholder: AssetImage('assets/loading.gif'), 
//               image: NetworkImage('https://via.placeholder.com/300x400'),
//               height: 140,
//               width: 100,
//               fit: BoxFit.cover,
//                ),
//           ),

//           SizedBox(height: 5),

//           const Text(
//             'actor.name aaaa aaaa',
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           )
//         ],
//         )
//     );
//   }
// }