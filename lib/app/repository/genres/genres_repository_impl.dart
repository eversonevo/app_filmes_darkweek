import 'package:app_filmes_darkweek/app/application/rest_client/rest_client.dart';
import 'package:app_filmes_darkweek/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>('/genre/movie/list',
        // é quando passa o api_key para ter acesso a informacoes
        query: {
          'api_key': RemoteConfig.instance.getString('api_filmes'),
          'language': 'pt-br'
        },
        // decoder, Get q converte em Modelo
        // traduz json em model
        decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      return <GenreModel>[];
    });

    if (result.hasError) {
      // ignore: avoid_print
      print("Erro ao buscar o genres ${result.statusText}");
      throw Exception("Erro ao buscar gêneros");
    }
    return result.body ?? <GenreModel>[];
  }
}
