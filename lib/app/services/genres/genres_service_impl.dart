import 'package:app_filmes_darkweek/app/repository/genres/genres_repository.dart';
import 'package:app_filmes_darkweek/models/genre_model.dart';

import 'genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
