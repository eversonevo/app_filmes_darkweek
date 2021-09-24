import 'package:app_filmes_darkweek/app/application/rest_client/rest_client.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_filmes'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];

        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      // ignore: avoid_print
      print('Erro ao buscar popular movies [${result.statusText}]');

      throw Exception('Erro ao buscar popular movies');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRetad() async {
    final result = await _restClient.get(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString('api_filmes'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];

        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      // ignore: avoid_print
      print('Erro ao buscar top movies [${result.statusText}]');

      throw Exception('Erro ao buscar top movies');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result =
        await _restClient.get<MovieDetailModel>('/movie/$id', query: {
      'api_key': RemoteConfig.instance.getString('api_filmes'),
      'language': 'pt-br',
      'append_to_response': 'images,credits',
      'include_image_language': 'en,pt-br',
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });

    if (result.hasError) {
      // ignore: avoid_print
      print('Erro ao buscar detalhes dos movies [${result.statusText}]');

      throw Exception('Erro ao buscar detalhes do movies');
    }

    return result.body;
  }

  // pode ser em outro arquivo

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        favoriteData.docs.first.reference.delete();
      }
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesmovies(String userId) async {
    var favoritiesMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];
    for (var movie in favoritiesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
