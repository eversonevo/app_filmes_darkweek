import 'package:app_filmes_darkweek/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
