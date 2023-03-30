
// class MoviesProvider extends ChangeNotifier{
//   String _apiKey = 'c0138205d3b2dc6403ce71d9d5c851d2';
//   String _baseUrl = 'api.themoviedb.org';
//   String _language = 'es-ES';

//   MoviesProvider(){
//     print('Movies Provider inicial aaa');
//     this.getOnDisplayMovies();

//   }

//   getOnDisplayMovies() async {
//    var url =
//       Uri.https(_baseUrl, '/3/movie/500', 
//       {
//         'api_key': _apiKey,
//         'language': _language,
//         'page': '1'
//       });

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   print(response.body);
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas_aplicacion/helpers/debouncer.dart';
import 'package:peliculas_aplicacion/models/models.dart';
import 'package:peliculas_aplicacion/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'c0138205d3b2dc6403ce71d9d5c851d2';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  Map<int, List<Cast>> moviesCast = {};
    
  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 ),
  );

  final StreamController<List<Movie>> _suggestionStreamContoller = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamContoller.stream;



  MoviesProvider() {
    //print('MoviesProvider inicializado');
     getOnDisplayMovies();
     getPopularMovies();

  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async {
    
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage );
    final popularResponse = PopularResponse.fromJson( jsonData );
    
    popularMovies = [ ...popularMovies, ...popularResponse.results ];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast( int movieId ) async {

    if( moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson( jsonData );

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies( String query ) async {

    final url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.results;
  }

  void getSuggestionsByQuery( String searchTerm ) {

    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      // print('Tenemos valor a buscar: $value');
      final results = await searchMovies(value);
      _suggestionStreamContoller.add( results );
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration( milliseconds: 301)).then(( _ ) => timer.cancel());
  }


}