import 'package:app_filmes_darkweek/models/genre_model.dart';

abstract class GenresRepository {
  Future<List<GenreModel>> getGenres();
}
